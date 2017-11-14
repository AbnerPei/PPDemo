//
//  LearnSystemAPIBaseViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/3/22.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "LearnSystemAPIBaseViewController.h"
#import "NSArray+Sort.h"
@class PPBook;

@interface PPStudent : NSObject
@property(nonatomic,copy) NSString *firstname;
@property(nonatomic,copy) NSString *lastname;
@property(nonatomic,strong) PPBook *book;
@property(nonatomic,assign) NSInteger age;
+(PPStudent *)studentWithFirstname:(NSString *)firstName
                           lastname:(NSString *)lastname
                           bookName:(NSString *)bookName;
@end

@interface PPBook : NSObject
@property(nonatomic,copy) NSString *name;
@end

@implementation PPBook

@end

@implementation PPStudent
+(PPStudent *)studentWithFirstname:(NSString *)firstName lastname:(NSString *)lastname bookName:(NSString *)bookName age:(NSInteger)age
{
    PPStudent *stu = [[PPStudent alloc]init];
    stu.firstname = firstName;
    stu.lastname = lastname;
    stu.age = age;
    PPBook *aBook = [[PPBook alloc]init];
    aBook.name = bookName;
    stu.book = aBook;
    return stu;
}
@end
@interface LearnSystemAPIBaseViewController ()

@end

@implementation LearnSystemAPIBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"夯实iOS基本功";
    [self setupArrs];
    //
    arraySort4();
    
    //
//    arraySort1();
    
    //数组倒序（1，2，3）---> (3,2,1)
//    [self arrayInverted];
}

void arraySort1() {
    NSArray *array = [NSArray arrayWithObjects:@"2abc", @"36ere7d", @"dsfv1", @"4",YES, nil];
    
    // 返回一个排好序的数组，原来数组的元素顺序不会改变
    // 指定元素的比较方法：compare:
    NSArray *array2 = [array sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"array2:%@", array2);
    
    
}

#pragma mark 数组排序4-高级排序
void arraySort4() {
    PPStudent *stu1 = [PPStudent studentWithFirstname:@"MingJie" lastname:@"Li" bookName:@"book1" age:23];
    PPStudent *stu2 = [PPStudent studentWithFirstname:@"LongHu" lastname:@"Huang" bookName:@"book2" age:12];
    PPStudent *stu3 = [PPStudent studentWithFirstname:@"LianJie" lastname:@"Li" bookName:@"book2" age:34];
    PPStudent *stu4 = [PPStudent studentWithFirstname:@"Jian" lastname:@"Xiao" bookName:@"book1"age:50];
    NSArray *array = [NSArray arrayWithObjects:stu1,stu2,stu3, stu4,nil];
    
//    // 1.先按照书名进行排序
//    // 这里的key写的是@property的名称
//    NSSortDescriptor *bookNameDesc = [NSSortDescriptor sortDescriptorWithKey:@"book.name" ascending:YES];
//    // 2.再按照姓进行排序
//    NSSortDescriptor *lastnameDesc = [NSSortDescriptor sortDescriptorWithKey:@"lastname" ascending:YES];
//    // 3.再按照名进行排序
//    NSSortDescriptor *firstnameDesc = [NSSortDescriptor sortDescriptorWithKey:@"firstname" ascending:YES];
//    // 按顺序添加排序描述器
//    NSArray *descs = [NSArray arrayWithObjects:bookNameDesc, lastnameDesc, firstnameDesc,nil];
//
//    NSArray *array2 = [array sortedArrayUsingDescriptors:descs];
//
//    [array2 enumerateObjectsUsingBlock:^(PPStudent *aStu, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSLog(@"firstname %@",aStu.firstname);
//    }];
//
    
   NSArray *resultArr = [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        PPStudent *aStu = (PPStudent *)obj1;
        PPStudent *bStu = (PPStudent *)obj2;
        if (aStu.age > bStu.age) {
            return NSOrderedAscending;
        }else if (aStu.age < bStu.age){
            return NSOrderedDescending;
        }else{
            return NSOrderedSame;
        }
    }];
    [resultArr enumerateObjectsUsingBlock:^(PPStudent *aStu, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"firstname %@--age-%ld",aStu.firstname,(long)aStu.age);
    }];
    
}

-(void)arrayInverted
{
    NSArray *originalArr = @[@"1",@"2",@"3",@"4",@"5"];
    NSArray *resultArr = [originalArr pp_array_reversed];
    NSLog(@"end11 %@",resultArr);
    
    [originalArr enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"Reverse %lu--%@",(unsigned long)idx,obj);
        
    }];


}

-(void)setupArrs
{
    self.titles = [@[
                     @"Quartz 2D学习"
                     ] mutableCopy];
    
    self.vcs = [@[
                  @"Quartz2DViewController"
                  ] mutableCopy];
}

@end
