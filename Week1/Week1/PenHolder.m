//
//  PenHolder.m
//  Week1
//
//  Created by YongJai on 2017. 3. 15..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import "PenHolder.h"

@implementation NXPenHolder

-(id)initWithCapacity:(int)capacity{
    self = [super init];
    
    if(self){
        _pens = [NSMutableArray arrayWithCapacity:capacity];
        _usage = (_usage/capacity);
    }
    return self;
}

-(void)add:(NXpen*)pen{
    if(_usage > [_pens count]){
        NSLog(@"자리없음");
    }
    else{
        [_pens addObject:pen];
        ++_usage;
    }
}

-(void)remove:(int)penIndex{
    if(_usage < penIndex){
        NSLog(@"뺄게 없음");
    }
    else{
        [_pens removeObject:_pens];
        --_usage;
    }
}

-(int)usage{
    return _usage;
}

-(void)printDescription{
    NSLog(@"\nNXPenHolder\n pens : %@, usage : %d%%\n\n", _pens, _usage);
}
@end
