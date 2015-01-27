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
@property (strong, nonatomic) IBOutlet UILabel *lblTimeToFinish;
@property (weak, nonatomic) IBOutlet UIButton *btnPush;

//Actions
- (IBAction)btnPushSender:(id)sender;

//Images
@property (strong, nonatomic) IBOutlet UIImageView *imgBackground;

@end

