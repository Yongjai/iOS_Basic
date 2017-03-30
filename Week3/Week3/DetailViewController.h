//
//  DetailViewController.h
//  Week3
//
//  Created by YongJai on 2017. 3. 29..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyModel.h"

@interface DetailViewController : UIViewController

@property int random;
@property MyModel *jsonModel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
