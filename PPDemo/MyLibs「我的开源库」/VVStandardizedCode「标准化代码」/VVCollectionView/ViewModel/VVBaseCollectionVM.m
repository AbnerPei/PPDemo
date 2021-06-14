//
//  VVBaseCollectionVM.m
//  PPDemo
//
//  Created by AbnerPei on 2021/5/22.
//

#import "VVBaseCollectionVM.h"
#import "VVSafe.h"
#import "VVAssert.h"
#import "VVSectionModelProtocol.h"
#import "VVReuseModelProtocol.h"
#import "VVBaseCollectionVMConfig.h"

@implementation VVBaseCollectionVM
@synthesize datas;
@synthesize config = _config;
@synthesize hasMore;

// !!!: VVListVMProtocol - 必须
- (NSInteger)sectionCount
{
    if (self.config.isMutipleSection) {
        return self.datas.count;
    } else {
        return 1;
    }
}

- (id)modelAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.config.isMutipleSection) {
        id sectionModel = vv_objectAtIndexInArray(indexPath.section, self.datas);
        if (!sectionModel) {
            return nil;
        }
        if ([sectionModel conformsToProtocol:@protocol(VVSectionModelProtocol)] && [sectionModel respondsToSelector:@selector(datas)]) {
            return vv_objectAtIndexInArray(indexPath.section, [sectionModel datas]);
        } else {
            VVAssertReturnNil(NO, @"sectionObject must conform protocol VVSectionModelProtocol and respond selector datas");
        }
    }
    return vv_objectAtIndexInArray(indexPath.section, self.datas);
}

- (NSString *)cellClassNameAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.config.isMutipleSection) {
        if (self.config.isMutipleCell) {
            /// 多section && 多种cell
            /// 先解析section,再解析item
            id sectionModel = vv_objectAtIndexInArray(indexPath.section, self.datas);
            if (!sectionModel) {
                return nil;
            }
            if ([sectionModel conformsToProtocol:@protocol(VVSectionModelProtocol)] && [sectionModel respondsToSelector:@selector(datas)]) {
                NSArray *sectionDatas = [sectionModel datas];
                id itemModel = vv_objectAtIndexInArray(indexPath.item, sectionDatas);
                if (!itemModel) {
                    return nil;
                }
                
                if ([itemModel conformsToProtocol:@protocol(VVReuseModelProtocol)] && [itemModel respondsToSelector:@selector(reuseViewClassName)]) {
                    return [itemModel reuseViewClassName];
                } else {
                    VVAssertReturnNil(NO, @"object must conform protocol VVReuseModelProtocol and respond selector reuseClassName");
                }
            } else {
                VVAssertReturnNil(NO, @"object must conform protocol VVSectionModelProtocol and respond selector datas");
            }
        }
    } else {
        if (self.config.isMutipleCell) {
            /// 一个section && 多种cell
            id itemModel = vv_objectAtIndexInArray(indexPath.item, self.datas);
            if (!itemModel) {
                return nil;
            }
            if ([itemModel conformsToProtocol:@protocol(VVReuseModelProtocol)] && [itemModel respondsToSelector:@selector(reuseViewClassName)]) {
                return [itemModel reuseViewClassName];
            } else {
                VVAssertReturnNil(NO, @"object must conform protocol VVReuseModelProtocol and respond selector reuseClassName");
            }
        }
    }
    return self.config.cellClassName;
}

// !!!: VVCollectionVMProtocol
- (NSInteger)columnCountInSection:(NSInteger)section
{
    if (self.config.isMutipleSection) {
        id sectionObject = vv_objectAtIndexInArray(section, self.datas);
        if (!sectionObject) {
            return 1;
        }
        if ([sectionObject conformsToProtocol:@protocol(VVSectionModelProtocol)]
            && [sectionObject respondsToSelector:@selector(columnCount)]) {
            return [sectionObject columnCount];
        } else {
            VVAssertReturn(NO, @"sectionObject must conform protocol VVSectionModelProtocol and respond selector columnCount", 1);
        }
    }
    return self.config.columnCount;
}

- (NSInteger)itemCountInSection:(NSInteger)section
{
    if (self.config.isMutipleSection) {
        id sectionModel = vv_objectAtIndexInArray(section, self.datas);
        if (!sectionModel) {
            return 0;
        }
        if ([sectionModel conformsToProtocol:@protocol(VVSectionModelProtocol)] && [sectionModel respondsToSelector:@selector(datas)]) {
            return [sectionModel datas].count;
        } else {
            VVAssertReturn(NO, @"sectionObject must conform protocol VVSectionModelProtocol and respond selector datas", 0);
        }
    }
    return self.datas.count;
}

- (CGFloat)minimumLineSpacingInSection:(NSInteger)section
{
    if (self.config.isMutipleSection) {
        id sectionModel = vv_objectAtIndexInArray(section, self.datas);
        if (sectionModel && [sectionModel conformsToProtocol:@protocol(VVSectionModelProtocol)] && [sectionModel respondsToSelector:@selector(minimumLineSpacing)]) {
            return [sectionModel minimumLineSpacing];
        }
    }
    return self.config.minimumLineSpacing;
}

- (CGFloat)minimumInteritemSpacingInSection:(NSInteger)section
{
    if (self.config.isMutipleSection) {
        id sectionModel = vv_objectAtIndexInArray(section, self.datas);
        if (sectionModel && [sectionModel conformsToProtocol:@protocol(VVSectionModelProtocol)] && [sectionModel respondsToSelector:@selector(minimumInteritemSpacing)]) {
            return [sectionModel minimumInteritemSpacing];
        }
    }
    return self.config.minimumInteritemSpacing;
}

- (UIEdgeInsets)insetsInSection:(NSInteger)section
{
    if (self.config.isMutipleSection) {
        id sectionModel = vv_objectAtIndexInArray(section, self.datas);
        if (sectionModel && [sectionModel conformsToProtocol:@protocol(VVSectionModelProtocol)] && [sectionModel respondsToSelector:@selector(sectionInsets)]) {
            return [sectionModel sectionInsets];
        }
    }
    return self.config.sectionInsets;
}

// !!!: VVScrollVMProtocol - 可选
- (id)modelForHeaderInSection:(NSInteger)section
{
    if (self.config.isMutipleSection) {
        id sectionModel = vv_objectAtIndexInArray(section, self.datas);
        if (!sectionModel) {
            return nil;
        }
        if ([sectionModel conformsToProtocol:@protocol(VVSectionModelProtocol)] && [sectionModel respondsToSelector:@selector(headerModel)]) {
            return [sectionModel headerModel];
        } else {
            VVAssertReturnNil(NO, @"sectionModel must conform protocol VVSectionModelProtocol and respond selector headerModel");
        }
    }
    return self.config.headerModel;
}

- (id)modelForFooterInSection:(NSInteger)section
{
    if (self.config.isMutipleSection) {
        id sectionModel = vv_objectAtIndexInArray(section, self.datas);
        if (!sectionModel) {
            return nil;
        }
        if ([sectionModel conformsToProtocol:@protocol(VVSectionModelProtocol)] && [sectionModel respondsToSelector:@selector(footerModel)]) {
            return [sectionModel footerModel];
        } else {
            VVAssertReturnNil(NO, @"sectionModel must conform protocol VVSectionModelProtocol and respond selector footerModel");
        }
    }
    return self.config.footerModel;
}

- (NSString *)classNameForHeaderInSection:(NSInteger)section
{
    if (self.config.isMutipleSection) {
        id sectionModel = vv_objectAtIndexInArray(section, self.datas);
        if (!sectionModel) {
            return nil;
        }
        if ([sectionModel conformsToProtocol:@protocol(VVSectionModelProtocol)] && [sectionModel respondsToSelector:@selector(headerModel)]) {
            id headerModel = [sectionModel headerModel];
            if (!headerModel) {
                return nil;
            }
            
            if ([headerModel conformsToProtocol:@protocol(VVReuseModelProtocol)] && [headerModel respondsToSelector:@selector(reuseViewClassName)]) {
                return [headerModel reuseViewClassName];
            } else {
                VVAssertReturnNil(NO, @"headerModel must conform protocol VVReuseModelProtocol and respond selector reuseViewClassName");
            }
        } else {
            VVAssertReturnNil(NO, @"sectionModel must conform protocol VVSectionModelProtocol and respond selector headerModel");
        }
    }
    
#warning pp605,新增
    if (self.config.headerModel) {
        id headerModel = self.config.headerModel;
        if ([headerModel conformsToProtocol:@protocol(VVReuseModelProtocol)] && [headerModel respondsToSelector:@selector(reuseViewClassName)]) {
            return [headerModel reuseViewClassName];
        }
    }
    return self.config.headerClassName;
}

- (NSString *)classNameForFooterInSection:(NSInteger)section
{
    if (self.config.isMutipleSection) {
        id sectionModel = vv_objectAtIndexInArray(section, self.datas);
        if (!sectionModel) {
            return nil;
        }
        if ([sectionModel conformsToProtocol:@protocol(VVSectionModelProtocol)] && [sectionModel respondsToSelector:@selector(footerModel)]) {
            id footerModel = [sectionModel footerModel];
            if (!footerModel) {
                return nil;
            }
            
            if ([footerModel conformsToProtocol:@protocol(VVReuseModelProtocol)] && [footerModel respondsToSelector:@selector(reuseViewClassName)]) {
                return [footerModel reuseViewClassName];
            } else {
                VVAssertReturnNil(NO, @"footerModel must conform protocol VVReuseVMProtocol and respond selector reuseViewClassName");
            }
        } else {
            VVAssertReturnNil(NO, @"sectionModel must conform protocol VVSectionModelProtocol and respond selector footerModel");
        }
    }
    return self.config.footerClassName;
}

// !!!: getter
- (__kindof NSObject<VVCollectionVMConfigProtocol> *)config
{
    if (!_config) {
        _config = VVBaseCollectionVMConfig.defaultConfig;
    }
    return _config;
}

@end
