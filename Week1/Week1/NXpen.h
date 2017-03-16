//
//  NXpen.h
//  Week1
//
//  Created by YongJai on 2017. 3. 15..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import <Foundation/Foundation.h>

//인스턴스 변수 선언
@interface NXpen : NSObject {
    NSString* _brand;
    NSString* _color;
    int _usage;
}
//생성자
-(id)initWithBrand:(NSString*)aBrand;

//getter와 setter
-(NSString*)brand;
-(NSString*)color;
-(int)usage;
-(void)setBrand:(NSString*)brand;
-(void)setColor:(NSString*)color;
-(void)setUsage:(int)usage;

-(void)printDescription;

@end
