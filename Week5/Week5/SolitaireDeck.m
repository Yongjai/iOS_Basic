//
//  SolitaireDeck.m
//  Week5
//
//  Created by YongJai on 2017. 4. 12..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import "SolitaireDeck.h"

@implementation SolitaireDeck

- (void)cardObject {
    cardDeck = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"49",@"50",@"51",@"52", nil];
}

- (NSString *)randomCard {
    int randomNum = arc4random() %52;
    NSString *pickNum = [cardDeck objectAtIndex:randomNum];
    [cardDeck removeObjectAtIndex:randomNum];
    return pickNum;
}

- (NSMutableArray *)cardAlloc {
    cardArr = [[NSMutableArray alloc]init];
    [self cardObject];
    
    [cardArr insertObject:[NSArray arrayWithObjects:[self randomCard],nil] atIndex:0];
    [cardArr insertObject:[NSArray arrayWithObjects:[self randomCard],[self randomCard],nil] atIndex:1];
    [cardArr insertObject:[NSArray arrayWithObjects:[self randomCard],[self randomCard],[self randomCard],nil] atIndex:2];
    [cardArr insertObject:[NSArray arrayWithObjects:[self randomCard],[self randomCard],[self randomCard],[self randomCard],nil] atIndex:3];
    [cardArr insertObject:[NSArray arrayWithObjects:[self randomCard],[self randomCard],[self randomCard],[self randomCard],[self randomCard],nil] atIndex:4];
    [cardArr insertObject:[NSArray arrayWithObjects:[self randomCard],[self randomCard],[self randomCard],[self randomCard],[self randomCard],[self randomCard],nil] atIndex:5];
    [cardArr insertObject:[NSArray arrayWithObjects:[self randomCard],[self randomCard],[self randomCard],[self randomCard],[self randomCard],[self randomCard],[self randomCard],nil] atIndex:6];
    
    return cardArr;
}

- (void)displayCards {
    NSLog(@"%@", cardArr);
}

- (NSString *)cardShapeAndNum:(int)card {
    switch (card) {
        case 1:
            return @"c2";
        case 2:
            return @"c3";
        case 3:
            return @"c4";
        case 4:
            return @"c5";
        case 5:
            return @"c6";
        case 6:
            return @"c7";
        case 7:
            return @"c8";
        case 8:
            return @"c9";
        case 9:
            return @"c10";
        case 10:
            return @"cA";
        case 11:
            return @"cJ";
        case 12:
            return @"cK";
        case 13:
            return @"cQ";
        case 14:
            return @"d2";
        case 15:
            return @"d3";
        case 16:
            return @"d4";
        case 17:
            return @"d5";
        case 18:
            return @"d6";
        case 19:
            return @"d7";
        case 20:
            return @"d8";
        case 21:
            return @"d9";
        case 22:
            return @"d10";
        case 23:
            return @"dA";
        case 24:
            return @"dJ";
        case 25:
            return @"dK";
        case 26:
            return @"dQ";
        case 27:
            return @"h2";
        case 28:
            return @"h3";
        case 29:
            return @"h4";
        case 30:
            return @"h5";
        case 31:
            return @"h6";
        case 32:
            return @"h7";
        case 33:
            return @"h8";
        case 34:
            return @"h9";
        case 35:
            return @"h10";
        case 36:
            return @"hA";
        case 37:
            return @"hJ";
        case 38:
            return @"hK";
        case 39:
            return @"hQ";
        case 40:
            return @"s2";
        case 41:
            return @"s3";
        case 42:
            return @"s4";
        case 43:
            return @"s5";
        case 44:
            return @"s6";
        case 45:
            return @"s7";
        case 46:
            return @"s8";
        case 47:
            return @"s9";
        case 48:
            return @"s10";
        case 49:
            return @"sA";
        case 50:
            return @"sJ";
        case 51:
            return @"sK";
        case 52:
            return @"sQ";
        default:
            return @"";
    }
}
@end
