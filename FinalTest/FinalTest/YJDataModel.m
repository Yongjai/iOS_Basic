//
//  YJDataModel.m
//  FinalTest
//
//  Created by YongJai on 07/06/2017.
//  Copyright © 2017 YongJai. All rights reserved.
//

#import "YJDataModel.h"

@implementation memo {
    RLMRealm *realm;
}

- (void) insertMemo {
    [realm transactionWithBlock:^{
        [realm addOrUpdateObject:self];
    }];
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"data" object:nil];
}

@end

RLM_ARRAY_TYPE(memo);

