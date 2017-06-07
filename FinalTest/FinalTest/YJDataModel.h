//
//  YJDataModel.h
//  FinalTest
//
//  Created by YongJai on 07/06/2017.
//  Copyright © 2017 YongJai. All rights reserved.
//

#import <Realm/Realm.h>
#import <RLMObject.h>

@interface memo : RLMObject

@property NSString *memo;
@property NSDate *time;

- (void) insertMemo;

@end
