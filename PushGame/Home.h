//
//  ViewController.h
//  PushGame
//
//  Created by Galileo Guzman on 19/01/15.
//  Copyright (c) 2015 Galileo Guzman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Home : UIViewController

//Labels
@property (strong, nonatomic) IBOutlet UILabel *lblScore;

//Actions
- (IBAction)btnPushSender:(id)sender;

@end
