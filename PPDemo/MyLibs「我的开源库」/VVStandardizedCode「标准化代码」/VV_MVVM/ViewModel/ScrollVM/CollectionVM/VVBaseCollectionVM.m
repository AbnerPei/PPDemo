//
//  VVBaseCollectionVM.m
//  PPDemo
//
//  Created by AbnerPei on 2021/5/22.
//

#import "VVBaseCollectionVM.h"
#import "VVSafe.h"
#import "VVSectionModelProtocol.h"
#import "VVAssert.h"

@implementation VVBaseCollectionVMConfig


@end

@implementation VVBaseCollectionVM

// !!!: VVScrollVMProtocol - 必须
- (NSInteger)vv_sectionCount
{
    if (self.vv_config.vv_isMutipleSection) {
        return self.vv_datas.count;
    }
    return 1;
}

- (nullable NSString *)vv_cellClassNameAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (self.vv_config.vv_isMutipleSection) {
        if (self.vv_config.vv_isMutipleCell) {
            /// 多section && 多种cell
            /// 先解析section,再解析item
            id sectionModel = vv_objectAtIndexInArray(indexPath.section, self.vv_datas);
            if (!sectionModel) {
                return nil;
            }
            if ([sectionModel conformsToProtocol:@protocol(VVSectionModelProtocol)] && [sectionModel respondsToSelector:@selector(vv_datas)]) {
                NSArray *sectionDatas = [sectionModel vv_datas];
                id itemModel = vv_objectAtIndexInArray(indexPath.item, sectionDatas);
                if (!itemModel) {
                    return nil;
                }
                
                if ([itemModel conformsToProtocol:@protocol(VVReuseVMProtocol)] && [itemModel respondsToSelector:@selector(vv_reuseClassName)]) {
                    return [itemModel vv_reuseClassName];
                } else {
                    VVAssertReturnNil(NO, @"object must conform protocol VVReuseVMProtocol and respond selector vv_reuseClassName");
                }
            } else {
                VVAssertReturnNil(NO, @"object must conform protocol VVSectionModelProtocol and respond selector vv_datas");
            }
        }
    } else {
        if (self.vv_config.vv_isMutipleCell) {
            /// 一个section && 多种cell
            id itemModel = vv_objectAtIndexInArray(indexPath.item, self.vv_datas);
            if (!itemModel) {
                return nil;
            }
            if ([itemModel conformsToProtocol:@protocol(VVReuseVMProtocol)] && [itemModel respondsToSelector:@selector(vv_reuseClassName)]) {
                return [itemModel vv_reuseClassName];
            } else {
                VVAssertReturnNil(NO, @"object must conform protocol VVReuseVMProtocol and respond selector vv_reuseClassName");
            }
        }
    }
    return self.vv_config.vv_cellClassName;
}

- (nullable id)vv_modelAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (self.vv_config.vv_isMutipleSection) {
        id sectionModel = vv_objectAtIndexInArray(indexPath.section, self.vv_datas);
        if (!sectionModel) {
            return nil;
        }
        if ([sectionModel conformsToProtocol:@protocol(VVSectionModelProtocol)] && [sectionModel respondsToSelector:@selector(vv_datas)]) {
            return vv_objectAtIndexInArray(indexPath.section, [sectionModel vv_datas]);
        } else {
            VVAssertReturnNil(NO, @"sectionObject must conform protocol VVSectionModelProtocol and respond selector vv_datas");
        }
    }
    return vv_objectAtIndexInArray(indexPath.section, self.vv_datas);
}

// !!!: VVCollectionVMProtocol - 必须
- (NSInteger)vv_numberOfItemsInSection:(NSInteger)section
{
    if (self.vv_config.vv_isMutipleSection) {
        id sectionModel = vv_objectAtIndexInArray(section, self.vv_datas);
        if (!sectionModel) {
            return 0;
        }
        if ([sectionModel conformsToProtocol:@protocol(VVSectionModelProtocol)] && [sectionModel respondsToSelector:@selector(vv_datas)]) {
            return [sectionModel vv_datas].count;
        } else {
            VVAssertReturn(NO, @"sectionObject must conform protocol VVSectionModelProtocol and respond selector vv_datas", 0);
        }
    }
    return self.vv_datas.count;
}

// !!!: VVScrollVMProtocol - 可选
- (nullable id)vv_headerModelInSection:(NSInteger)section
{
    if (self.vv_config.vv_isMutipleSection) {
        id sectionModel = vv_objectAtIndexInArray(section, self.vv_datas);
        if (!sectionModel) {
            return nil;
        }
        if ([sectionModel conformsToProtocol:@protocol(VVSectionModelProtocol)] && [sectionModel respondsToSelector:@selector(vv_headerModel)]) {
            return [sectionModel vv_headerModel];
        } else {
            VVAssertReturnNil(NO, @"sectionModel must conform protocol VVSectionModelProtocol and respond selector vv_headerModel");
        }
    }
    return self.vv_config.vv_sectionHeaderModel;
}

- (nullable id)vv_footerModelInSection:(NSInteger)section
{
    if (self.vv_config.vv_isMutipleSection) {
        id sectionModel = vv_objectAtIndexInArray(section, self.vv_datas);
        if (!sectionModel) {
            return nil;
        }
        if ([sectionModel conformsToProtocol:@protocol(VVSectionModelProtocol)] && [sectionModel respondsToSelector:@selector(vv_footerModel)]) {
            return [sectionModel vv_footerModel];
        } else {
            VVAssertReturnNil(NO, @"sectionModel must conform protocol VVSectionModelProtocol and respond selector vv_footerModel");
        }
    }
    return self.vv_config.vv_sectionFooterModel;
}

- (nullable NSString *)vv_headerClassNameInSection:(NSInteger)section
{
    if (self.vv_config.vv_isMutipleSection) {
        id sectionModel = vv_objectAtIndexInArray(section, self.vv_datas);
        if (!sectionModel) {
            return nil;
        }
        if ([sectionModel conformsToProtocol:@protocol(VVSectionModelProtocol)] && [sectionModel respondsToSelector:@selector(vv_headerModel)]) {
            id headerModel = [sectionModel vv_headerModel];
            if (!headerModel) {
                return nil;
            }
            
            if ([headerModel conformsToProtocol:@protocol(VVReuseVMProtocol)] && [headerModel respondsToSelector:@selector(vv_reuseClassName)]) {
                return [headerModel vv_reuseClassName];
            } else {
                VVAssertReturnNil(NO, @"headerModel must conform protocol VVReuseVMProtocol and respond selector vv_reuseClassName");
            }
        } else {
            VVAssertReturnNil(NO, @"sectionModel must conform protocol VVSectionModelProtocol and respond selector vv_headerModel");
        }
    }
    return self.vv_config.vv_sectionHeaderClassName;
}

- (nullable NSString *)vv_footerClassNameInSection:(NSInteger)section
{
    if (self.vv_config.vv_isMutipleSection) {
        id sectionModel = vv_objectAtIndexInArray(section, self.vv_datas);
        if (!sectionModel) {
            return nil;
        }
        if ([sectionModel conformsToProtocol:@protocol(VVSectionModelProtocol)] && [sectionModel respondsToSelector:@selector(vv_footerModel)]) {
            id footerModel = [sectionModel vv_footerModel];
            if (!footerModel) {
                return nil;
            }
            
            if ([footerModel conformsToProtocol:@protocol(VVReuseVMProtocol)] && [footerModel respondsToSelector:@selector(vv_reuseClassName)]) {
                return [footerModel vv_reuseClassName];
            } else {
                VVAssertReturnNil(NO, @"footerModel must conform protocol VVReuseVMProtocol and respond selector vv_reuseClassName");
            }
        } else {
            VVAssertReturnNil(NO, @"sectionModel must conform protocol VVSectionModelProtocol and respond selector vv_headerModel");
        }
    }
    return self.vv_config.vv_sectionFooterClassName;
}

@end
