//
//  SecondViewController.m
//  Week3
//
//  Created by YongJai on 2017. 3. 29..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import "SecondViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UIButton *Btn;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.Btn.layer.cornerRadius = 6.0f;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"detailSegue"]){
        DetailViewController *detailView = (DetailViewController*) segue.destinationViewController;
        int random = [[[NSNumber alloc] initWithInt:(arc4random()%4)] intValue];
        detailView.random = random;
    }
}


@end
