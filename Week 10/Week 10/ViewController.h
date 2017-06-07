//
//  ViewController.h
//  Week 10
//
//  Created by YongJai on 17/05/2017.
//  Copyright © 2017 YongJai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property NSString *bookfile;
@property NSInteger bookLen;
@property NSArray *words;

@property NSString *maxWord;
@property NSNumber *maxCount;
@property NSString *minWord;
@property NSNumber *minCount;

@property (weak, nonatomic) IBOutlet UIButton *bookCountBtn;
@property (weak, nonatomic) IBOutlet UIButton *listCountBtn;
@property (weak, nonatomic) IBOutlet UITextField *wordTextField;


@end

