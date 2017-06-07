//
//  YJDataModel.m
//  FinalTest
//
//  Created by YongJai on 07/06/2017.
//  Copyright © 2017 YongJai. All rights reserved.
//

#import "YJDataModel.h"

@implementation Memo


-(instancetype) initPrivate {
    self = [super init];
    if (self){
    }
    return self;
}


- (void) insertMemo {
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:self];
    }];
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"data" object:nil];
    NSLog(@"%@", self);
}

@end

