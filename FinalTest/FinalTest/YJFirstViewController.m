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
#import "YJDetailViewController.h"


@interface YJFirstViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation YJFirstViewController {
    RLMResults<Memo*> *memoList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    memoList = [Memo allObjects];
    
    NSNotificationCenter *notiCenter = [NSNotificationCenter defaultCenter];
    [notiCenter addObserver:self selector:@selector(reloadCollectionView) name:@"data" object:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void) reloadCollectionView{
    [_memoCollectionView reloadData];
    NSLog(@"call");
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    int i = [memoList count];
    NSLog(@"%d", i);
    return [memoList count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YJCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    Memo *memos = [memoList objectAtIndex:indexPath.row];
    cell.memoTextLabel.text = memos.memo;
    
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    format.dateStyle = NSDateFormatterMediumStyle;
    format.timeStyle = NSDateFormatterNoStyle;
    format.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    
    cell.memoTimeLabel.text = [format stringFromDate:memos.time];
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"segueDetail" sender:self];
}


//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    NSIndexPath *indexPath = [_memoCollectionView indexPathsForSelectedItems];
//    Memo *memos = [memoList objectAtIndex:indexPath.row];
//    NSMutableArray *Arr
//
//    [segue.destinationViewController performSelector:@selector(setMemoText:)withObject:]
////    NSMutableArray *selectedMemo = [ objectAtIndex:indexPath.row];
//
//}

@end
