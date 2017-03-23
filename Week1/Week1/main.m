//
//  main.m
//  Week1
//
//  Created by YongJai on 2017. 3. 15..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import "NXpen.h"
#import "PenHolder.h"
#import "NXFileMatcher.h"

int main(int argc, const char * argv[]) {
    
    NXPenHolder *penholder = [[NXPenHolder alloc]initWithCapacity:5];
    
    NXpen *Pen1 = [[NXpen alloc]initWithBrand:@"Bic"];
    [Pen1 setColor:@"RED" ];
    [Pen1 setUsage:30];
    [Pen1 printDescription];
    
    NXpen *Pen2 = [[NXpen alloc]initWithBrand:@"hitgtec-c"];
    [Pen2 setColor:@"Blue" ];
    [Pen2 setUsage:10];
    [Pen2 printDescription];
    
    [penholder add:(NXpen *)Pen1.brand];
    [penholder add:(NXpen *)Pen2.brand];
    [penholder printDescription];
    
    [penholder remove:1];
    [penholder printDescription];
    
    NSLog(@"------아래는 파일 출력------");
    
    NXFileMatcher *fm = [[NXFileMatcher alloc]init];
    [fm displayAllFilsAtPath:@"/Users/NEXT/Desktop/자료구조와 알고리즘"];
    [fm displayAllFilesAtPath:@"/Users/NEXT/Desktop/자료구조와 알고리즘" filterByExtension:@"txt"];

    
}


