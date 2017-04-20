//
//  SolitaireDeck.h
//  Week5
//
//  Created by YongJai on 2017. 4. 12..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SolitaireDeck : NSObject {

NSMutableArray *cardArr;
NSMutableArray *cardDeck;
}

-(NSString*)cardShapeAndNum:(int)card;
-(NSMutableArray*)cardAlloc;
-(void)displayCards;
-(void)cardObject;


@end
