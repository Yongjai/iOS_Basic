//
//  ViewController.m
//  Week7
//
//  Created by YongJai on 2017. 4. 26..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

NSMutableDictionary *images;
NSArray *imageName;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    images = [[NSMutableDictionary alloc]init];
    for(int i=0; i<22; i++) {
        CGRect imageViewFrame;
        imageViewFrame = CGRectMake(0, 200*i, 375, 200);
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageViewFrame];
        UIImage *myImage = [UIImage imageNamed:[NSString stringWithFormat:@"%02d.jpg", (i+1)]];
                imageView.image = myImage;
        
        NSLog(@"앙?: %@", myImage);
        [self.scrollView addSubview:imageView];
        [images setObject:imageView forKey:[imageName objectAtIndex:i]];
    }
    [_scrollView setContentSize:CGSizeMake(375, 200*22)];
    
    NSInteger fitstviewCount = 200;
    
    for(int i=0; i < fitstviewCount; i++){
        [_scrollView addSubview:[images objectForKey:[imageName objectAtIndex:i]]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    
    
}
@end
