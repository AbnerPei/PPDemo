//
//  MinimumXXSpacingViewController.m
//  PPDemo
//
//  Created by PPAbner on 2020/12/17.
//

#import "MinimumXXSpacingViewController.h"
#import <PPMaker/PPMaker.h>

@interface MinimumXXSpacingViewController ()<UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation MinimumXXSpacingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark --- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MinimumXXSpacingViewControllerCell" forIndexPath:indexPath];
//    cell.contentView.backgroundColor =
    return cell;
}

#pragma mark --- lazy load
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.minimumLineSpacing = 20;
        flowLayout.minimumInteritemSpacing = 80;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        _collectionView.dataSource = self;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"MinimumXXSpacingViewControllerCell"];
    }
    return _collectionView;
}

@end
