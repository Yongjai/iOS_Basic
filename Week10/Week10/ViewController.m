//
//  ViewController.m
//  Week10
//
//  Created by YongJai on 15/05/2017.
//  Copyright © 2017 YongJai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintsHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintsWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintsTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintsLeading;
@property (weak, nonatomic) IBOutlet UIButton *firstBtn;
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickedBtn:(id)sender {
    [UIView animateKeyframesWithDuration:1
                                   delay:0
                                 options:NO
                              animations:^{
                                  _firstBtn.frame = CGRectMake(_firstBtn.frame.origin.x + 200, _firstBtn.frame.origin.y + 300, _firstBtn.frame.size.width, _firstBtn.frame.size.height - 50);
                                  _firstBtn.backgroundColor = [UIColor yellowColor];
                              }
                              completion:^(BOOL finished) {
                                  [UIView animateKeyframesWithDuration:1
                                                                 delay:1
                                                               options:NO
                                                            animations:^{
                                                                _firstBtn.frame = CGRectMake(_firstBtn.frame.origin.x - 200, _firstBtn.frame.origin.y - 300, _firstBtn.frame.size.width, _firstBtn.frame.size.height + 50);
                                                                _firstBtn.backgroundColor = [UIColor brownColor];
                                                            }
                                                            completion:^(BOOL finished) {

                                                            }];
                              }];
}


-(void)workingProgress {
    NSString *bookfile = [NSString stringWithContentsOfFile:[[NSBundle mainBundle]
                                                             pathForResource:@"bookfile" ofType:@".txt"]  encoding:NSUTF8StringEncoding error:nil];
    int length = (int)bookfile.length;
    int spaceCount = 0;
    __block float progress = 0;
    unichar aChar;
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    for (int nLoop=0; nLoop<length; nLoop++) {
        aChar = [bookfile characterAtIndex:nLoop];
        if (aChar==' '){
            spaceCount++;
            dispatch_sync(mainQueue, ^{
                progress = (float)nLoop / (float)length;
                _progressBar.progress = progress;
            });
        }
    }
    dispatch_sync(mainQueue, ^{
        [[[UIAlertView alloc] initWithTitle:@"완료"
                                    message:[NSString stringWithFormat:@"찾았다 %d개",spaceCount]
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil, nil] show];
    });
}


- (IBAction)clickedReadBtn:(id)sender {
    _progressBar.progress = 0;
    dispatch_queue_t aQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(aQueue, ^{
        [self workingProgress];
    });
}



@end
