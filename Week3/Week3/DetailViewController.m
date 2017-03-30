//
//  DetailViewController.m
//  Week3
//
//  Created by YongJai on 2017. 3. 29..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.jsonModel = [[MyModel alloc] init];
    [self setRandomImageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setRandomImageView {
    NSDictionary *imageData = [self.jsonModel itemAtIndex:self.random];
    self.imageView.image = [UIImage imageNamed:[imageData objectForKey:@"image"]];
    self.titleLabel.text = [imageData objectForKey:@"title"];
    
}


@end
