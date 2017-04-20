//
//  ViewController.m
//  Week6
//
//  Created by YongJai on 2017. 4. 19..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import "ViewController.h"
#import "CardDeck.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property (weak, nonatomic) IBOutlet UIImageView *image3;
@property (strong, nonatomic) CardDeck *cardDeck;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cardDeck = [[CardDeck alloc]init];
    [self registerRandomizeObserver];
    [self.cardDeck randomize];
}

-(void) didReceiveRandomizeNotification:(NSNotification*) notification {
    id object1 = [notification.userInfo objectForKey:@"message1"];
    id object2 = [notification.userInfo objectForKey:@"message2"];
    id object3 = [notification.userInfo objectForKey:@"message3"];

    NSString *image1 = [NSString stringWithFormat:@"%@.png", object1];
    NSString *image2 = [NSString stringWithFormat:@"%@.png", object2];
    NSString *image3 = [NSString stringWithFormat:@"%@.png", object3];

    UIImage *uiImage1 = [UIImage imageNamed:image1];
    UIImage *uiImage2 = [UIImage imageNamed:image2];
    UIImage *uiImage3 = [UIImage imageNamed:image3];

    [self.image1 setImage:uiImage1];
    [self.image2 setImage:uiImage2];
    [self.image3 setImage:uiImage3];
}

-(void) registerRandomizeObserver {
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(didReceiveRandomizeNotification:) name:@"random_noti" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)clickedRandomBtn:(id)sender {
    [self.cardDeck randomize];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    [self.cardDeck randomize];
}




@end
