//
//  YJSecondViewController.m
//  FinalTest
//
//  Created by YongJai on 07/06/2017.
//  Copyright © 2017 YongJai. All rights reserved.
//

#import "YJSecondViewController.h"
#import "YJDataModel.h"

@interface YJSecondViewController ()

@end

@implementation YJSecondViewController


- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)clickedAddBtn:(id)sender {
    memo *memoText = [[memo alloc]init];
    memoText.memo = _memoTextField.text;
    memoText.time = [NSDate date];
    
    [memoText insertMemo];
}




@end
