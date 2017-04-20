//
//  CardDeck.m
//  Week6
//
//  Created by YongJai on 2017. 4. 19..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import "CardDeck.h"

@implementation CardDeck

- (instancetype)init {
    self = [super init];
    if (self) {
        _cardCategory = @[@"c", @"d", @"h", @"s"];
        _cardList = [[NSMutableArray alloc] init];
        [self makeCardDeck];
    }
    return self;
}


-(void) randomize {
    int random1 = arc4random() % self.cardList.count;
    int random2 = arc4random() % self.cardList.count;
    int random3 = arc4random() % self.cardList.count;

    NSString *name1 = [self.cardList objectAtIndex:random1];
    NSString *name2 = [self.cardList objectAtIndex:random2];
    NSString *name3 = [self.cardList objectAtIndex:random3];
    
    NSDictionary *userInfo = @{ @"message1": name1,
                                @"message2": name2,
                                @"message3": name3
                                };
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:@"random_noti" object:nil userInfo:userInfo];
}

-(void) makeCardDeck {
    for (int i = 0; i < 4; i++) {
        for (int j = 1; j <= 13; j++) {
            NSString* name = [NSString stringWithFormat:@"%@%@", [_cardCategory objectAtIndex:i], [self returnCardNumber:j]];
            [_cardList addObject:name];
        }
    }
}

-(id) returnCardNumber:(int) number {
    id result;
    
    switch (number) {
        case 1:
            result = @"A";
            break;
        case 11:
            result = @"J";
            break;
        case 12:
            result = @"Q";
            break;
        case 13:
            result = @"K";
            break;
        default:
            result = [NSNumber numberWithInt:number];
            break;
    }
    
    return result;
}

//- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
//    
//    NSLog(@"keyPath:[%@] change:[%@]",keyPath, [change description]);
//    
//    if ([keyPath isEqualToString:@"random_noti"]){
//        
//    }
//
//}

@end
