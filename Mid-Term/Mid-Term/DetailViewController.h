//
//  DetailViewController.h
//  Mid-Term
//
//  Created by YongJai on 01/05/2017.
//  Copyright © 2017 YongJai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *detailTitle;
@property (weak, nonatomic) IBOutlet UIImageView *detailView;
@property (weak, nonatomic) IBOutlet UILabel *detailDate;

@property NSDictionary *seguedData;

@end
