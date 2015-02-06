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
NSIndexPath *currentIndexPath;


@interface Scores ()

@end

@implementation Scores

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dataController = [[DataController alloc]init];
    
    records = [dataController getScores];
    NSLog(@"total de records %d", records.count);
    
}

- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"viewDidAppear");
    [self.tblRecords scrollToRowAtIndexPath:currentIndexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
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
    
    Record *lastRecord = [dataController getLastRecord];
    static NSString *CellIdentifier = @"cellRecord";
    
    cellRecord *cell = (cellRecord *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[cellRecord alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Record *r = records[indexPath.row];
    cell.lblScore.text = [NSString stringWithFormat:@"%@", r.score];
    cell.lblTimestamp.text = r.timeStamp;
    
    if ([r.timeStamp isEqualToString:lastRecord.timeStamp]) {
        cell.backgroundColor = [UIColor blueColor];
        currentIndexPath = [NSIndexPath indexPathForRow:(int)indexPath.row inSection:0];
        
    }
    else{
        cell.backgroundColor = [UIColor clearColor];
    }
    
    return cell;
}

- (IBAction)btnBackSender:(id)sender {
    
    [self performSegueWithIdentifier:@"playAgain" sender:self];
}
@end
