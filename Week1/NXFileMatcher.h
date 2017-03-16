//
//  NXFileMatcher.h
//  Week1
//
//  Created by YongJai on 2017. 3. 15..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NXFileMatcher : NSObject

-(void)displayAllFilsAtPath:(NSString*)path;
-(void)displayAllFilesAtPath:(NSString*)path
             filterByExtension:(NSString*)extension;

@end
