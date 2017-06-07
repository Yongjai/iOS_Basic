//
//  YJFirstViewController.m
//  FinalTest
//
//  Created by YongJai on 07/06/2017.
//  Copyright © 2017 YongJai. All rights reserved.
//

#import "YJFirstViewController.h"
#import "YJCollectionViewCell.h"
#import "YJDataModel.h"
#import <Realm/Realm.h>


@interface YJFirstViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation YJFirstViewController {
    RLMResults<memo*> *memoList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    memoList = [memo allObjects];
    
    NSNotificationCenter *notiCenter = [NSNotificationCenter defaultCenter];
    [notiCenter addObserver:self selector:@selector(reloadCollectionView) name:@"data" object:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   
}

- (void) reloadCollectionView{
    [_memoCollectionView reloadData];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return memoList.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YJCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    memo *memos = [memoList objectAtIndex:indexPath.row];
    cell.memoTextLabel.text = memos.memo;
    
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@""];
    cell.memoTimeLabel.text = [format stringFromDate:memos.time];
   
    return cell;
}


@end
