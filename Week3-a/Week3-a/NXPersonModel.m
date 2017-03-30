//
//  NXPersonModel.h
//  Week2
//
//  Created by YongJai on 2017. 3. 22..
//  Copyright © 2017년 YongJai. All rights reserved.
//


#import "NXPersonModel.h"

@implementation NXPersonModel

@synthesize persons;
@synthesize person;

- (id)init{
    self = [super init];
    if(self){
        [self initializeData];
    }
    return self;
}

- (void)initializeData{
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"persons" ofType:@"txt"];
    NSString *dataString = [[NSString alloc] initWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:nil];
    NSArray * separatedData = [dataString componentsSeparatedByString:@"\n"];
    
    person = [[NSMutableDictionary alloc] init];
    persons = [[NSMutableArray alloc] init];
    for (NSString * data in separatedData){
        NSArray * seperatedData = [data componentsSeparatedByString:@","];
        [person setObject:seperatedData[0] forKey:@"이름"];
        [person setObject:seperatedData[1] forKey:@"학번"];
        [person setObject:seperatedData[2] forKey:@"성별"];
        [person setObject:seperatedData[3] forKey:@"팀"];
        NSMutableDictionary * newDict = [[NSMutableDictionary alloc] initWithDictionary:person];
        [persons addObject:newDict];
    }
}

- (NSString *)personNameAtIndex:(int)index{
    NSString * name = [persons[index] objectForKey:@"이름"];
    NSLog(@"%@", name);
    return name;
}

- (NSNumber *)personNumberAtIndex:(int)index{
    NSNumber * number = [persons[index] objectForKey:@"학번"];
    NSLog(@"%@", number);
    return number;
}

- (BOOL)isMaleAtIndex:(int)index{
    NSString * gender = [persons[index] objectForKey:@"성별"];
    if([gender isEqualToString:@"M"]){
        NSLog(@"YES");
        return YES;
    }
    NSLog(@"NO");
    return NO;
}

- (NSNumber *)personTeamAtIndex:(int)index{
    NSNumber * number = [persons[index] objectForKey:@"팀"];
    NSLog(@"%@", number);
    return number;
}

- (NSDictionary *)getPersonObjectAtIndex:(int)index{
    NSLog(@"%@", persons[index]);
    return persons[index];
}


- (NSString*) findPersonNameByNumber:(NSNumber*)number{
    for(NSMutableDictionary * student in persons){
        NSString * stringNumber = [number stringValue] ;
        if([[student objectForKey:@"학번"] isEqualToString:stringNumber]){
            NSLog(@"%@", [student objectForKey:@"이름"]);
            return [student objectForKey:@"이름"];
        }
    }
    NSLog(@"찾는 사람이 없습니다");
    return nil;
}



- (NSString*) findPersonNumberByName:(NSString*)name{
    for(NSMutableDictionary* student in persons){
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
    NSArray *sortedArray = [persons sortedArrayUsingDescriptors:sortDescriptors];
    NSLog(@"%@",sortedArray);
    return sortedArray;
}


- (NSArray*) sortedByNumber{
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"숫자"
                                                 ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray = [persons sortedArrayUsingDescriptors:sortDescriptors];
    NSLog(@"%@",sortedArray);
    return sortedArray;
}


- (NSArray*) sortedByTeam{
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"팀"
                                                 ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray = [persons sortedArrayUsingDescriptors:sortDescriptors];
    NSLog(@"%@",sortedArray);
    return sortedArray;
}

- (NSString *) getNamesWithSort {
    NSArray * sortResult = [self sortedByNumber];
    NSMutableString * nameString = [[NSMutableString alloc] init];
    for(NSDictionary * data in sortResult){
        [nameString appendString:[data objectForKey:@"이름"]];
        [nameString appendString:@", "];
    }
    return [nameString substringToIndex:[nameString length]-2];
}

@end
