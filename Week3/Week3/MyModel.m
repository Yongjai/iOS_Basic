//
//  MyModel.m
//  Week3
//
//  Created by YongJai on 2017. 3. 29..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import "MyModel.h"

@implementation MyModel

-(id)init{
    self = [super init];
    if(self){
        [self initializeJsonData];
    }
    return self;
}

- (void)initializeJsonData {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"json" ofType:@"txt"];
    NSString * jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    self.jsonArray = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:NULL];
}

- (NSDictionary *)itemAtIndex:(int)index{
    return self.jsonArray[index];
}

@end
