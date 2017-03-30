//
//  MyModel.h
//  Week3
//
//  Created by YongJai on 2017. 3. 29..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyModel : NSObject

@property NSArray *jsonArray;

- (NSDictionary *)itemAtIndex:(int)index;

@end
