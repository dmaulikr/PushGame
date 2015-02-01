//
//  DataController.h
//  PushGame
//
//  Created by Galileo Guzman on 26/01/15.
//  Copyright (c) 2015 Galileo Guzman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Record.h"

@interface DataController : NSObject
{
    sqlite3 *databaseHandle;
}

- (void)initDatabase;
- (void) insertScore:(Record*)record;
- (NSMutableArray*) getScores;
- (Record*) getLastRecord;
@end
