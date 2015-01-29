//
//  Scores.m
//  PushGame
//
//  Created by Galileo Guzman on 21/01/15.
//  Copyright (c) 2015 Galileo Guzman. All rights reserved.
//

#import "Scores.h"
#import "Record.h"
#import "DataController.h"
#import "cellRecord.h"

NSArray *records;
DataController *dataController;

@interface Scores ()

@end

@implementation Scores

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dataController = [[DataController alloc]init];
    
    NSLog(@"Se inicia el controlador");
    records = [dataController getScores];
    NSLog(@"total de records %d", records.count);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return records.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 64;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    static NSString *CellIdentifier = @"cellRecord";
    
    cellRecord *cell = (cellRecord *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[cellRecord alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.lblScore.text = records[indexPath.row];
    cell.lblTimestamp.text = records[indexPath.row];
    
    return cell;
}

@end
