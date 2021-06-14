//
//  VVBaseCollectionVMConfig.m
//  PPDemo
//
//  Created by AbnerPei on 2021/6/13.
//

#import "VVBaseCollectionVMConfig.h"
#import "VVSafe.h"

@interface VVBaseCollectionVMConfig ()

@property (nonatomic, assign) BOOL isMutipleCell;

@end

@implementation VVBaseCollectionVMConfig
@synthesize cellClassName;
@synthesize headerClassName;
@synthesize footerClassName;
@synthesize headerModel;
@synthesize footerModel;
@synthesize minimumLineSpacing;
@synthesize minimumInteritemSpacing;
@synthesize sectionInsets;
@synthesize columnCount;
@synthesize isMutipleSection;
@synthesize isMutipleCell;

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupDefaultInitData];
    }
    return self;
}

// !!!: private method
- (void)setupDefaultInitData
{
    self.columnCount = 1;
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    self.sectionInsets = UIEdgeInsetsZero;
}

// !!!:getter
+ (VVBaseCollectionVMConfig *)defaultConfig
{
    VVBaseCollectionVMConfig *config = [[VVBaseCollectionVMConfig alloc] init];
    return config;
}

- (BOOL)isMutipleCell
{
    /// self.cellClassName不为空，说明只有一种cell
    return vv_isEmptyStr(self.cellClassName);
}

@end
