//
//  PenHolder.h
//  Week1
//
//  Created by YongJai on 2017. 3. 15..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NXpen.h"

@interface NXPenHolder : NSObject {
    NSMutableArray* _pens;
    int _capacity;
    int _usage;
}

-(id)initWithCapacity:(int)capacity;

-(void)add:(NXpen*)pen;
-(void)remove:(int)penIndex;
-(int)usage;

-(void)printDescription;

@end
