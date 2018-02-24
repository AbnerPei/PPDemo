//
//  NSSortDescriptorViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/1/2.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "NSSortDescriptorViewController.h"
#import "SortDescriptorPeople.h"
@interface NSSortDescriptorViewController ()

@end

@implementation NSSortDescriptorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *firstNames = @[ @"Alice", @"Bob", @"Charlie", @"Quentin" ];
    NSArray *lastNames = @[ @"Smith", @"Jones", @"Smith", @"Alberts" ];
    NSArray *ages = @[ @24, @27, @33, @31 ];
    
    NSMutableArray *people = [NSMutableArray array];
    [firstNames enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        SortDescriptorPeople *person = [[SortDescriptorPeople alloc] init];
        person.firstName = [firstNames objectAtIndex:idx];
        person.lastName = [lastNames objectAtIndex:idx];
        person.age = [ages objectAtIndex:idx];
        [people addObject:person];
    }];
    
    NSSortDescriptor *firstNameSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"firstName"ascending:YES selector:@selector(localizedStandardCompare:)];
    
    NSSortDescriptor *lastNameSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"lastName"ascending:YES selector:@selector(localizedStandardCompare:)];
    
    NSSortDescriptor *ageSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"age"ascending:NO];
    
    NSLog(@"By age: %@", [people sortedArrayUsingDescriptors:@[ageSortDescriptor]]);
    // "Charlie Smith", "Quentin Alberts", "Bob Jones", "Alice Smith"
    
    
    NSLog(@"By first name: %@", [people sortedArrayUsingDescriptors:@[firstNameSortDescriptor]]);
    // "Alice Smith", "Bob Jones", "Charlie Smith", "Quentin Alberts"
    
    
    NSLog(@"By last name, first name: %@", [people sortedArrayUsingDescriptors:@[lastNameSortDescriptor, firstNameSortDescriptor]]);
    // "Quentin Alberts", "Bob Jones", "Alice Smith", "Charlie Smith"
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
