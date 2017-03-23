//
//  main.m
//  Week2
//
//  Created by YongJai on 2017. 3. 22..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NXPersonModel.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NXPersonModel *personModel = [[NXPersonModel alloc]initWithDataPath:@"/Users/NEXT/Desktop/iOS_Dev/document/file.txt"];
        //텍스트 파일로 저장 안하고 바로 가져올 수는 없을까??? 그렇게 다시 코딩 해봐야지~ㅎㅎ
        
        [personModel personNameAtIndex:3];
        [personModel personNumberAtIndex:2];
        [personModel isMaleAtIndex:4];
        [personModel personTeamAtIndex:5];
        [personModel getPersonObjectAtIndex:1];
        
        [personModel findPersonNameByNumber:@131059];
        [personModel findPersonNumberByName:@"수지"];
        
        [personModel sortedByName];
        [personModel sortedByNumber];
        [personModel sortedByTeam];
    }
}
