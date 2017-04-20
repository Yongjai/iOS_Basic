//
//  CardDeck.h
//  Week6
//
//  Created by YongJai on 2017. 4. 19..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CardDeck : NSObject

@property (strong, nonatomic) NSArray *cardCategory;
@property (strong, nonatomic) NSMutableArray *cardList;

- (void)randomize;
- (void)makeCardDeck;
- (id)returnCardNumber:(int) number;

@end
