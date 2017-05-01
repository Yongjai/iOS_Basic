//
//  DetailViewController.m
//  Mid-Term
//
//  Created by YongJai on 01/05/2017.
//  Copyright © 2017 YongJai. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _detailTitle.text = [_seguedData objectForKey:@"title"];
    _detailDate.text = [_seguedData objectForKey:@"date"];
    [_detailView setImage:[UIImage imageNamed:[_seguedData objectForKey:@"image"]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
