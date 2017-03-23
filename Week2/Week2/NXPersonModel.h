//
//  NXPersonModel.h
//  Week2
//
//  Created by YongJai on 2017. 3. 22..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NXPersonModel : NSObject

@property NSMutableArray * personArray;
@property NSMutableDictionary * personDict;



- (id)initWithDataPath:(NSString*)path;
- (NSString *)personNameAtIndex:(int)index;
- (NSNumber *)personNumberAtIndex:(int)index;
- (BOOL)isMaleAtIndex:(int)index;
- (NSNumber *)personTeamAtIndex:(int)index;
- (NSDictionary *)getPersonObjectAtIndex:(int)index;

- (NSString*) findPersonNameByNumber:(NSNumber*)number;
- (NSNumber*) findPersonNumberByName:(NSString*)name;

- (NSArray*) sortedByName;
- (NSArray*) sortedByNumber;
- (NSArray*) sortedByTeam;

// 필터링은 나중에...ㅎ
//- (NSArray*) filterByTeam:(NSNumber*)team;
//- (NSArray*) filterByGender:(BOOL)isMale;
//- (NSArray*) filterDistinctByLastName;



@end
