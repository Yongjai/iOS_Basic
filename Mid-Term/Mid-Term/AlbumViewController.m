//
//  AlbumViewController.m
//  Mid-Term
//
//  Created by YongJai on 01/05/2017.
//  Copyright © 2017 YongJai. All rights reserved.
//

#import "AlbumViewController.h"
#import "DataModel.h"
#import "DetailViewController.h"
#import "AlbumTableViewCell.h"

@interface AlbumViewController ()


@end

@implementation AlbumViewController
{
    DataModel *dataModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getData:) name:@"json" object:nil];
    
    dataModel = [[DataModel alloc]init];
    [dataModel initData];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(orderByDate:)];
    
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)orderByDate:(id)sender {
    [dataModel ordering];
}

-(void)getData: (NSNotification *) notification {
    [self.tableView reloadData];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"show" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return dataModel.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdenfier = @"Album";
    AlbumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdenfier forIndexPath:indexPath];
    
    NSDictionary *data = [dataModel.data objectAtIndex:indexPath.row];
    
    [cell.imageView setImage:[UIImage imageNamed:[data objectForKey:@"image"]]];
    cell.titleLabel.text = [data objectForKey:@"title"];
    cell.dateLabel.text = [data objectForKey:@"date"];

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexpath = [self.tableView indexPathForSelectedRow];
    NSDictionary *selectedRow = [dataModel.data objectAtIndex:indexpath.row];
    DetailViewController * view = segue.destinationViewController;
    
    view.seguedData = selectedRow;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake)
    {
        [dataModel initData];
    }
}
@end
