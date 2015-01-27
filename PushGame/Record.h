//
//  Record.h
//  PushGame
//
//  Created by Galileo Guzman on 26/01/15.
//  Copyright (c) 2015 Galileo Guzman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Record : NSObject
{
    NSNumber *score;
    NSString *timeStamp;
}

@property (nonatomic, strong) NSNumber* score;
@property (nonatomic, strong) NSString* timeStamp;

-(id)initWithScore:(NSNumber*)aScore andTimeStamp:(NSString*)aTimeStamp;

@end
