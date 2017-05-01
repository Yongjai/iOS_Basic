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
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"myPlist.plist"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath])
    {
        plistPath = [[NSBundle mainBundle] pathForResource:@"manuallyData" ofType:@"plist"];
    }
    
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    self.image1 = [dict objectForKey:@"image1"];
    self.image2 = [dict objectForKey:@"image2"];
    self.image3 = [dict objectForKey:@"image3"];
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
    
    [imageA addObject:image1];
    [imageB addObject:image2];
    [imageC addObject:image3];
    
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
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"myPlist.plist"];
    
    NSDictionary *plistDict = [[NSDictionary alloc] initWithObjects: [NSMutableArray arrayWithObjects: imageA, imageB, imageC, nil] forKeys:[NSMutableArray arrayWithObjects: @"image1", "image2", "image3", nil]];
    
    NSString *error = nil;
    NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:plistDict format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
    
    if(plistData)
    {
        [plistData writeToFile:plistPath atomically:YES];
        NSLog(@"sucess");
    }
    else
    {
        NSLog(@"error");
    }
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    [self.cardDeck randomize];
}




@end
