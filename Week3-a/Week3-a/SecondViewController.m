//
//  SecondViewController.m
//  Week3-a
//
//  Created by YongJai on 2017. 3. 27..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.personModel = [[NXPersonModel alloc]init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchBtnTouched:(id)sender {
    NSString *name = _nameTextField.text;
    NSString *number = [_personModel findPersonNumberByName:name];
    _numberLabel.text = number;
}

- (IBAction)bringListBtnTouched:(id)sender {
    NSString * nameList = [_personModel getNamesWithSort];
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"목록" message:nameList preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
