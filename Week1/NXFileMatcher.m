//
//  NXFileMatcher.m
//  Week1
//
//  Created by YongJai on 2017. 3. 15..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import "NXFileMatcher.h"

@implementation NXFileMatcher

static NSFileManager *_fileManager = nil;

//경로 밑에 있는 모든 파일 출력
-(void)displayAllFilsAtPath:(NSString *)path{
    _fileManager = [NSFileManager defaultManager];
    NSArray* filearray = [_fileManager contentsOfDirectoryAtPath:path error:NULL];
    NSLog(@"%@", filearray);
}

//특정 확장자만 골라서 출력
-(void)displayAllFilesAtPath:(NSString *)path filterByExtension:(NSString *)extension{
    _fileManager = [NSFileManager defaultManager];
    NSArray* filearray = [_fileManager contentsOfDirectoryAtPath:path error:NULL];
    
    for(NSString* file in filearray){
        if([[file pathExtension]isEqualToString:extension])
            NSLog(@"%@", file);
    }
}


@end
