//
//  DataModel.m
//  Mid-Term
//
//  Created by YongJai on 01/05/2017.
//  Copyright © 2017 YongJai. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

- (void)initData {
    char *data = "[{\"title\":\"초록\",\"image\":\"01.jpg\",\"date\":\"20150116\"},\
    {\"title\":\"장미\",\"image\":\"02.jpg\",\"date\":\"20160505\"},\
    {\"title\":\"낙엽\",\"image\":\"03.jpg\",\"date\":\"20141212\"},\
    {\"title\":\"계단\",\"image\":\"04.jpg\",\"date\":\"20140301\"},\
    {\"title\":\"벽돌\",\"image\":\"05.jpg\",\"date\":\"20150101\"},\
    {\"title\":\"바다\",\"image\":\"06.jpg\",\"date\":\"20150707\"},\
    {\"title\":\"벌레\",\"image\":\"07.jpg\",\"date\":\"20140815\"},\
    {\"title\":\"나무\",\"image\":\"08.jpg\",\"date\":\"20161231\"},\
    {\"title\":\"흑백\",\"image\":\"09.jpg\",\"date\":\"20150102\"},\
    {\"title\":\"나비\",\"image\":\"10.jpg\",\"date\":\"20141225\"}]";
    
    NSData *jsonData = [NSData dataWithBytes:data length:strlen(data)];
    NSError *err = nil;
    NSMutableDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    _data = (NSMutableArray *)dataDic;
    [[NSNotificationCenter defaultCenter]postNotificationName:@"json" object:self userInfo:dataDic];
}

- (void)ordering {
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sort];
    [_data sortUsingDescriptors:sortDescriptors];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"json" object:self userInfo:(NSDictionary *)_data];
}
@end

