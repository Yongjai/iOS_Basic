//
//  NXpen.m
//  Week1
//
//  Created by YongJai on 2017. 3. 15..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import "NXpen.h"

@implementation NXpen

//init을 이용한 생성자는 다음과 같이 사용해야함. 
-(id)initWithBrand:(NSString *)aBrand {
    self = [super init];
    
    if(self){
        _brand = aBrand;
    }
    return self;
}

-(NSString *)brand{
    return _brand;
}
-(NSString *)color{
    return _color;
}
-(int)usage{
    return _usage;
}
-(void)setBrand:(NSString *)brand{
    _brand = brand;
}
-(void)setColor:(NSString *)color{
    _color = color;
}
-(void)setUsage:(int)usage{
    _usage = usage;
}

-(void)printDescription{
    NSLog(@"\nNXpen\nbrand : %@, color : %@, usage : %d%%\n\n", _brand, _color, _usage);
}

@end
