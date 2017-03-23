//
//  NXPersonModel.m
//  Week2
//
//  Created by YongJai on 2017. 3. 22..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import "NXPersonModel.h"

@implementation NXPersonModel

- (id)initWithDataPath:(NSString*)path{
    self = [super init];
    if(self){
        [self initializeData:path];
    }
    return self;
}

- (void)initializeData:(NSString*)path{
    NSString * dataString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    NSArray * separatedData = [dataString componentsSeparatedByString:@"\n"];
    
    _personDict = [[NSMutableDictionary alloc] init];
    _personArray = [[NSMutableArray alloc] init];
    for (NSString * data in separatedData){
        NSArray * seperatedData = [data componentsSeparatedByString:@","];
        [_personDict setObject:seperatedData[0] forKey:@"이름"];
        [_personDict setObject:seperatedData[1] forKey:@"학번"];
        [_personDict setObject:seperatedData[2] forKey:@"성별"];
        [_personDict setObject:seperatedData[3] forKey:@"팀"];
        NSMutableDictionary * newDict = [[NSMutableDictionary alloc] initWithDictionary:_personDict];
        [_personArray addObject:newDict];
    }
}

- (NSString *)personNameAtIndex:(int)index{
    NSString * name = [_personArray[index] objectForKey:@"이름"];
    NSLog(@"%@", name);
    return name;
}

- (NSNumber *)personNumberAtIndex:(int)index{
    NSNumber * number = [_personArray[index] objectForKey:@"학번"];
    NSLog(@"%@", number);
    return number;
}

- (BOOL)isMaleAtIndex:(int)index{
    NSString * gender = [_personArray[index] objectForKey:@"성별"];
    if([gender isEqualToString:@"M"]){
        NSLog(@"YES");
        return YES;
    }
    NSLog(@"NO");
    return NO;
}

- (NSNumber *)personTeamAtIndex:(int)index{
    NSNumber * number = [_personArray[index] objectForKey:@"팀"];
    NSLog(@"%@", number);
    return number;
}

- (NSDictionary *)getPersonObjectAtIndex:(int)index{
    NSLog(@"%@", _personArray[index]);
    return _personArray[index];
}

- (NSString*) findPersonNameByNumber:(NSNumber*)number{
    for(NSMutableDictionary * student in _personArray){
        NSString * stringNumber = [number stringValue] ;
        if([[student objectForKey:@"학번"] isEqualToString:stringNumber]){
            NSLog(@"%@", [student objectForKey:@"이름"]);
            return [student objectForKey:@"이름"];
        }
    }
    NSLog(@"찾는 사람이 없습니다");
    return nil;
}

- (NSNumber*) findPersonNumberByName:(NSString*)name{
    for(NSMutableDictionary* student in _personArray){
        if([[student objectForKey:@"이름"] isEqualToString:name]){
            NSLog(@"%@", [student objectForKey:@"학번"]);
            return [student objectForKey:@"학번"];
        }
    }
    NSLog(@"찾는 사람이 없습니다");
    return nil;
}

- (NSArray*) sortedByName{
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"이름"
                                                 ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray = [_personArray sortedArrayUsingDescriptors:sortDescriptors];
    NSLog(@"%@",sortedArray);
    return sortedArray;
}

- (NSArray*) sortedByNumber{
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"숫자"
                                                 ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray = [_personArray sortedArrayUsingDescriptors:sortDescriptors];
    NSLog(@"%@",sortedArray);
    return sortedArray;
}

- (NSArray*) sortedByTeam{
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"팀"
                                                 ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray = [_personArray sortedArrayUsingDescriptors:sortDescriptors];
    NSLog(@"%@",sortedArray);
    return sortedArray;
}
@end

