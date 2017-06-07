//
//  ViewController.m
//  Week12
//
//  Created by YongJai on 22/05/2017.
//  Copyright © 2017 YongJai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getData];
    NSLog(@"???");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getData {
    
    FMDatabase *db = [FMDatabase databaseWithPath:[[NSBundle mainBundle] pathForResource:@"top25" ofType:@"db"]];

    NSLog(@"%@", db);
    
    [db open];
    
    NSString *query = @"Select * from tbl_songs;";
    FMResultSet *result = [db executeQuery:query];
    

    NSLog(@"%@", result);
    
//    while ([result next]) {
//        tbl_songs
//    }
    
}


@end
