//
//  FirstViewController.m
//  Week3-a
//
//  Created by YongJai on 2017. 3. 27..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//root화면으로 pop하려면 코드로만 가능하다.
//pop은 스택처럼 쌓인 화면들을 제거하는 것을 의미!
- (IBAction)goRootBtnTouched:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
