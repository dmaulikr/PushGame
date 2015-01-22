//
//  ViewController.m
//  PushGame
//
//  Created by Galileo Guzman on 19/01/15.
//  Copyright (c) 2015 Galileo Guzman. All rights reserved.
//

#import "Home.h"

int counter;
NSTimer *myTimer;

@interface Home ()

@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    counter = 0;
    
    myTimer = [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(goToScores) userInfo:nil repeats:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)goToScores{
     [self performSegueWithIdentifier:@"GoToScores" sender:self];
}

- (IBAction)btnPushSender:(id)sender {
    counter++;
    self.lblScore.text = [NSString stringWithFormat:@"%d",counter];
}
@end
