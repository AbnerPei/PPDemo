//
//  CV_ObjectCopyingViewController.m
//  PPDemo
//
//  Created by AbnerPei on 2021/3/8.
//

#import "CV_ObjectCopyingViewController.h"
#import "CV_Coder.h"

@interface CV_ObjectCopyingViewController ()
@property (nonatomic, strong) CV_Person *person;
@property (nonatomic, strong) CV_User *user;
@end

@implementation CV_ObjectCopyingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self test_001];
//    [self test_002];
    
//    [self test_modelCopy];
    
//    [self test_003];
    
    [self updateWithDataSource];
}

/// 非容器类 不可变对象
- (void)test_001
{
    NSString *string = @"www.abnerpei.com";
    id stringCopy = [string copy];
    id stringMutableCopy = [string mutableCopy];
    
    NSLog(@"           string : %p       %@",string, NSStringFromClass([string class]));
    NSLog(@"       stringCopy : %p       %@",stringCopy, NSStringFromClass([stringCopy class]));
    NSLog(@"stringMutableCopy : %p       %@",stringMutableCopy, NSStringFromClass([stringMutableCopy class]));
}

/// 2.非容器类 可变对象
- (void)test_002
{
    NSMutableString *mString = [NSMutableString stringWithString:@"www.abnerpei.com"];
    id mStringCopy = [mString copy];
    id mStringMutableCopy = [mString mutableCopy];
    
    NSLog(@"\n\n");
    NSLog(@"           mString : %p       %@",mString, NSStringFromClass([mString class]));
    NSLog(@"       mStringCopy : %p       %@",mStringCopy, NSStringFromClass([mStringCopy class]));
    NSLog(@"mStringMutableCopy : %p       %@",mStringMutableCopy, NSStringFromClass([mStringMutableCopy class]));
}

- (void)test_modelCopy
{
    NSMutableArray *mutableArray = [NSMutableArray array];
    CV_Coder *model = [[CV_Coder alloc] initWithTitle:@"title" subTitle:[NSMutableString stringWithString:@"subTitle"] norArray:@[@"test1", @"test2"] mutArrry:mutableArray];
    CV_Coder *copyModel = [model copy];
    CV_Coder *mutableModel = [model mutableCopy];
    // 测试对象的拷贝
    NSLog(@"\n\n******TestModel内存地址******");
    NSLog(@"原始地址：%p", model);
    NSLog(@"copy地址：%p", copyModel);
    NSLog(@"mutableCopy地址：%p", mutableModel);
    
    // 测试对象拷贝对NSString类型属性的影响
    NSLog(@"\n\n******  属性title(NSString)内存地址  ******");
    NSLog(@"原始地址：%p", model.title);
    NSLog(@"copy地址：%p", copyModel.title);
    NSLog(@"mutableCopy地址：%p", mutableModel.title);
    
    // 测试对象拷贝对NSMutableString类型属性的影响
    NSLog(@"\n\n****** 属性subTitle(NSMutableString)内存地址 ******");
    NSLog(@"原始地址：%p", model.subTitle);
    NSLog(@"copy地址：%p", copyModel.subTitle);
    NSLog(@"mutableCopy地址：%p", mutableModel.subTitle);
    
    // 测试对象拷贝对非可变集合类型属性的影响
    NSLog(@"\n\n****** 属性norArray(NSArray)内存地址 ******");
    NSLog(@"原始地址：%p", model.norArray);
    NSLog(@"copy地址：%p", copyModel.norArray);
    NSLog(@"mutableCopy地址：%p", mutableModel.norArray);
    
    // 测试对象拷贝对可变几何类型属性的影响
    NSLog(@"\n\n****** 属性mutArrry(NSMutableArray)内存地址 ******");
    NSLog(@"原始地址：%p", model.mutArray);
    NSLog(@"copy地址：%p", copyModel.mutArray);
    NSLog(@"mutableCopy地址：%p", mutableModel.mutArray);
}

- (void)test_003
{
    CV_Person *person = [[CV_Person alloc] init];
    self.person = person;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    NSString *str = @"王五";
    NSMutableString *str = [[NSMutableString alloc] initWithString:@"赵六"];
    self.person.nameCopy = str;
    self.person.nameStrong = str;

    NSLog(@"111 str : %@ str指针 : %p",str, str);
    NSLog(@"111「属性值」nameCopy : %@ nameStrong : %@",self.person.nameCopy, self.person.nameStrong);
    NSLog(@"111「指针」nameCopy : %p nameStrong : %p\n\n",self.person.nameCopy, self.person.nameStrong);
    
//    str = @"王五-abner";
    [str appendString:@"-abner"];
    
    NSLog(@"222 str : %@ str指针 : %p",str, str);
    NSLog(@"222「属性值」nameCopy : %@ nameStrong : %@",self.person.nameCopy, self.person.nameStrong);
    NSLog(@"222「指针」nameCopy : %p nameStrong : %p",self.person.nameCopy, self.person.nameStrong);
}

- (void)updateWithDataSource
{
    ///模拟网络请求成功
    NSDictionary *params = @{
        @"nickName" : @"AbnerPei",
        @"identifier" : @"1"
    };
    
    NSMutableString *showingStr = [[NSMutableString alloc] initWithString:params[@"nickName"]];
    self.user.nickName = showingStr;
    self.user.identifier = params[@"identifier"];
    [showingStr appendFormat:@"(%@)",[self.user.identifier isEqualToString:@"1"] ? @"已认证" : @""];
    
    ///lb展示
//    lb.text = showingStr;
    
    NSLog(@"user.nickName %@",self.user.nickName);
}

- (CV_User *)user
{
    if (!_user) {
        _user = [[CV_User alloc] init];
    }
    return _user;
}

@end
