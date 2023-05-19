//
//  LBViewController.m
//  LBDecorationLayout
//
//  Created by liuboliu on 05/19/2023.
//  Copyright (c) 2023 liuboliu. All rights reserved.
//

#import "LBViewController.h"
#import "TPWorkStandItemCell.h"
#import "TPWorkStandHeaderView.h"
#import <LBDecorationLayout/LBCollectionDecorationLayout.h>
#import "VVWorkStandDecorationView.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.height>[[UIScreen mainScreen] bounds].size.width?[[UIScreen mainScreen] bounds].size.width:[[UIScreen mainScreen] bounds].size.height)

#define PLUS_SCALE [self rectScale]

@interface LBViewController ()

@property (nonatomic, strong) UICollectionView  *collectionView;

@end

@implementation LBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    [self.collectionView reloadData];
	// Do any additional setup after loading the view, typically from a nib.
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TPWorkStandItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([TPWorkStandItemCell class]) forIndexPath:indexPath];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0 * PLUS_SCALE, 28* PLUS_SCALE, 40 * PLUS_SCALE, 28 * PLUS_SCALE);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(CGRectGetWidth(self.view.bounds), 60 * PLUS_SCALE);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(CGRectGetWidth(self.view.bounds), 0 * PLUS_SCALE);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        TPWorkStandHeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NSStringFromClass([TPWorkStandHeaderView class]) forIndexPath:indexPath];
        return view;
    } else {
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NSStringFromClass([UICollectionReusableView class]) forIndexPath:indexPath];
        footer.backgroundColor = [UIColor cyanColor];
        return footer;
    }
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   
}

#pragma mark  - VVCollectionDecorationLayoutDelegte
- (Class)decorationViewClassOfSection:(NSInteger)section
{
    return VVWorkStandDecorationView.class;
}

#pragma mark - lazy load

-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        LBCollectionDecorationLayout *layout = [LBCollectionDecorationLayout new];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.adjustHeaderAndFooterLayout = YES;
        layout.decorationContainsHeader = YES;
        layout.vvDelegate = self;
        layout.decorationExtendEdges = ^UIEdgeInsets(NSInteger section) {
            return UIEdgeInsetsMake(0, 13 * PLUS_SCALE, - 20 * PLUS_SCALE, 13 * PLUS_SCALE);
        };
        layout.minimumInteritemSpacing = 1;
        layout.minimumLineSpacing = 20 * PLUS_SCALE;
        layout.itemSize = CGSizeMake(70 * PLUS_SCALE, 88 * PLUS_SCALE);
        [layout registerClass:[VVWorkStandDecorationView class] forDecorationViewOfKind:[VVWorkStandDecorationView kind]];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, CGRectGetHeight(self.view.bounds) - 100) collectionViewLayout:layout];
        _collectionView.contentInset = UIEdgeInsetsMake(15 * PLUS_SCALE, 0, 0, 0);
        [_collectionView registerClass:[TPWorkStandItemCell class] forCellWithReuseIdentifier:NSStringFromClass([TPWorkStandItemCell class])];
        [_collectionView registerClass:[TPWorkStandHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([TPWorkStandHeaderView class])];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass([UICollectionReusableView class])];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;
}


- (CGFloat)rectScale{
    if (SCREEN_WIDTH == 414) {
        return 1.1;
    }else if (SCREEN_WIDTH == 428){
        return 1.14;
    }else if (SCREEN_WIDTH == 390){
        return 1.04;
    }
    return SCREEN_WIDTH/375.0;
}
@end
