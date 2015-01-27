//
//  ViewController.m
//  PushGame
//
//  Created by Galileo Guzman on 19/01/15.
//  Copyright (c) 2015 Galileo Guzman. All rights reserved.
//

#import "Home.h"
#import "DataController.h"

int counter, seconder;
NSTimer *pushTimer, *chronTimer;

@interface Home ()

@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    counter = 0;
    seconder = 10;
    self.imgBackground.alpha = 0.35;
    self.btnPush.layer.cornerRadius = self.btnPush.frame.size.width / 2;
    
    chronTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(chronCounter) userInfo:nil repeats:YES];
    pushTimer = [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(goToScores) userInfo:nil repeats:NO];
    
    DataController *db = [[DataController alloc] init];
    [db initDatabase];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)chronCounter{
    seconder--;
    self.lblTimeToFinish.text = [NSString stringWithFormat:@"%d",seconder];
    
}

- (void)goToScores{
    chronTimer = nil;
    pushTimer = nil;
    
    NSDate *now = [[NSDate alloc] init];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"cccc, dd MMMM, YYYY, hh:mm aa"];
    DataController *dataController = [[DataController alloc] init];
    
    Record *record = [[Record alloc] initWithScore:[NSNumber numberWithInt:counter] andTimeStamp:[dateFormat stringFromDate:now]];
    
    [dataController insertScore:record];
    
    [self performSegueWithIdentifier:@"GoToScores" sender:self];
}

- (IBAction)btnPushSender:(id)sender {
    counter++;
}
@end
