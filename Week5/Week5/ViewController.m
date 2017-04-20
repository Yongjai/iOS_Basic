//
//  ViewController.m
//  Week5
//
//  Created by YongJai on 2017. 4. 12..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *cardDeck = [[NSArray alloc]initWithArray:[[NSUserDefaults standardUserDefaults]objectForKey:@"deck"]];
    
    if([cardDeck count])
}
- (IBAction)pressBtn:(id)sender {
    [self showCard];
}

-(void)viewWillAppear:(BOOL)animated{
    [self showCard];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)showCard {
    SolitaireDeck *deck = [[SolitaireDeck alloc]init];
    [deck displayCards];
    NSInteger pickCard;
    
    for(int i=0; i<7; i++) {
        for(int k=0; k<=i; k++) {
            pickCard = [[[_cardArr objectAtIndex:i]objectAtIndex:k]integerValue];
            UIImage *image = [UIImage imageNamed:[deck cardShapeAndNum:pickCard]];
            UIImageView *cardImage = [[UIImageView alloc] initWithImage:image];
            [cardImage setFrame:CGRectMake(26+i*140, 100+k*40, 130, 150)];
            [self.view addSubview:cardImage];
        }
    }
    for(int i=0;i<25;i++){
        pickCard = [[[_cardArr objectAtIndex:7]objectAtIndex:i] integerValue];
        UIImage *image = [UIImage imageNamed:[deck cardShapeAndNum:pickCard]];
        UIImageView *cardImage = [[UIImageView alloc] initWithImage:image];
        [cardImage setFrame:CGRectMake(26+i*24, 500, 130, 150)];
        [self.view addSubview:cardImage];
    }

}


@end
