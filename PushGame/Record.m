//
//  Record.m
//  PushGame
//
//  Created by Galileo Guzman on 26/01/15.
//  Copyright (c) 2015 Galileo Guzman. All rights reserved.
//

#import "Record.h"

@implementation Record

@synthesize score;
@synthesize timeStamp;

-(id)initWithScore:(NSNumber *)aScore andTimeStamp:(NSString *)aTimeStamp
{
    self = [super init];
    if (self) {
        self.score = aScore;
        self.timeStamp = aTimeStamp;
    }
    
    return self;
}


@end
