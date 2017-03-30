//
//  NXPersonModel.m
//  Week2
//
//  Created by YongJai on 2017. 3. 27..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NXPersonModel : NSObject

@property NSMutableArray * persons;
@property NSMutableDictionary * person;




- (NSString *)personNameAtIndex:(int)index;
- (NSNumber *)personNumberAtIndex:(int)index;
- (BOOL)isMaleAtIndex:(int)index;
- (NSNumber *)personTeamAtIndex:(int)index;
- (NSDictionary *)getPersonObjectAtIndex:(int)index;

- (NSString*) findPersonNameByNumber:(NSNumber*)number;
- (NSString*) findPersonNumberByName:(NSString*)name;

- (NSArray*) sortedByName;
- (NSArray*) sortedByNumber;
- (NSArray*) sortedByTeam;
- (NSString*) getNamesWithSort;

// 필터링은 나중에 ㅎㅎ
//- (NSArray*) filterByTeam:(NSNumber*)team;
//- (NSArray*) filterByGender:(BOOL)isMale;
//- (NSArray*) filterDistinctByLastName;

@end
