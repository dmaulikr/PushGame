//
//  DataController.m
//  PushGame
//
//  Created by Galileo Guzman on 26/01/15.
//  Copyright (c) 2015 Galileo Guzman. All rights reserved.
//

#import "DataController.h"
#import "Record.h"

NSString *databasePath;
NSInteger *lastRecord;

@implementation DataController

-(void)initDatabase{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    databasePath = [documentsDirectory stringByAppendingPathComponent:@"record.db"];
    
    bool databaseAlreadyExists = [[NSFileManager defaultManager] fileExistsAtPath:databasePath];

    
    if (sqlite3_open([databasePath UTF8String], &databaseHandle) == SQLITE_OK)
    {
        
        //NSLog(@"SE SE CREO LA BD EN EL PATH DE LA APP");
        if (!databaseAlreadyExists)
        {
            NSLog(@"SE PREPARAN LAS SENTENCIAS");
            const char *sqlStatement = "CREATE TABLE IF NOT EXISTS RECORD (ID INTEGER PRIMARY KEY AUTOINCREMENT, SCORE INT, TIMESTAMP TEXT)";
            
            char *error;
            if (sqlite3_exec(databaseHandle, sqlStatement, NULL, NULL, &error) == SQLITE_OK)
            {
                NSLog(@"Base de datos creada con la tabla");
            }
            else
            {
                NSLog(@"Error %s", error);
            }
        }
        else{
            //NSLog(@"PARECE QUE YA ESTA CREADA");
            //La base de Datos ya esta creada
        }
    }
}

-(void)dealloc{
    sqlite3_close(databaseHandle);
}

-(void) insertScore:(Record*)record{
    
    NSString *statementInsert = [NSString stringWithFormat:@"INSERT INTO RECORD (SCORE, TIMESTAMP) VALUES (%@, \"%@\")",record.score, record.timeStamp];
    
    if (sqlite3_open([databasePath UTF8String], &databaseHandle) == SQLITE_OK){
        
        char *error;
        if (sqlite3_exec(databaseHandle, [statementInsert UTF8String], NULL, NULL, &error) == SQLITE_OK) {
            lastRecord = sqlite3_last_insert_rowid(databaseHandle);
            //NSLog(@"RECORD AGREGADO CORRECTAMENTE");
            //Record insertado correctamente
        }else{
            NSLog(@"ERROR %s", sqlite3_errmsg(databaseHandle));
        }
    }else{
        NSLog(@"Error al abrir la bd");
    }
    
}

-(NSArray*) getScores{
    NSMutableArray *scores = [[NSMutableArray alloc] init];
    
    const char *statementSelect = "SELECT SCORE, TIMESTAMP FROM RECORD ORDER BY SCORE DESC";
    
    sqlite3_stmt *statement;
    
    if (sqlite3_open([databasePath UTF8String], &databaseHandle) == SQLITE_OK){
        if(sqlite3_prepare_v2(databaseHandle, statementSelect, -1, &statement, NULL) == SQLITE_OK){
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                Record *rowRecord = [[Record alloc] initWithScore:[NSNumber numberWithInt:sqlite3_column_int(statement, 0)] andTimeStamp:[NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 1)]];
                
                [scores addObject:rowRecord];
                
            }
            sqlite3_finalize(statement);
        }else
        {
            NSLog(@"Error %s", sqlite3_errmsg(databaseHandle));
        }
    
    }else{
        NSLog(@"Error al abrir la base de datos");
    }
    
    NSLog(@"%lld",(long long) lastRecord);
    return scores;
}

- (Record*) getLastRecord{
    Record *lastInsert = [[Record alloc] init];
    NSString *statementSelect = [NSString stringWithFormat:@"SELECT SCORE, TIMESTAMP FROM RECORD WHERE ID = %lld", (long long)lastRecord];
    
    sqlite3_stmt *statement;
    
    if(sqlite3_open([databasePath UTF8String], &databaseHandle) == SQLITE_OK){
        if(sqlite3_prepare_v2(databaseHandle, [statementSelect UTF8String], -1, &statement, NULL) == SQLITE_OK){
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                lastInsert = [[Record alloc] initWithScore:[NSNumber numberWithInt:sqlite3_column_int(statement, 0)] andTimeStamp:[NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 1)]];
                
                //NSLog(@"Record %@ %@", lastRecord.score, lastRecord.timeStamp);
            }
            sqlite3_finalize(statement);
        }else
        {
            NSLog(@"Error %s", sqlite3_errmsg(databaseHandle));
        }
    }
    
    return lastInsert;
}

@end
