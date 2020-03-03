//
//  BHFMDBManager.m
//  MyApp
//
//  Created by mac on 2019/7/2.
//  Copyright © 2019 Haochuang. All rights reserved.
//

#import "BHFMDBManager.h"

#define TableAllData               @"TableAllData"
#define Tablename                  @"name"
#define Tablesex                   @"sex"
#define Tableschool                @"school"
#define Tablezhuanye               @"zhuanye"
#define Tablephone                 @"phone"
#define Tableshoukenainji          @"shoukenainji"
#define Tableprice                 @"price"
#define TabletyepeKe               @"tyepeKe"

@implementation BHFMDBManager

static BHFMDBManager *manager = nil;
+ (BHFMDBManager *)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

#pragma mark
// 1.创建数据库
- (void)createTable {
    
    NSString* docuPath =  [self _getAppDocumentPath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:docuPath]) { // 如果不存在直接创建
        [[NSFileManager defaultManager] createDirectoryAtPath:docuPath withIntermediateDirectories:NO attributes:nil error:nil];
    }
    // 数据库的路径
    NSString *path = [docuPath stringByAppendingPathComponent:@"XKCDKListDB.sqlite"];

    if (self.isShowDebugLog) {
        NSLog(@"create--XKCityList-- path == %@ ",path);
    }
    _dbQueue = [[FMDatabaseQueue alloc] initWithPath:path];
    _dbPool = [[FMDatabasePool alloc] initWithPath:path];
    [self createCityTable];
}

// 2.创建表
- (void)createCityTable {
    [_dbQueue inDatabase:^(FMDatabase * _Nonnull db) {
        [db setShouldCacheStatements:YES];
        db.logsErrors = YES;
        if ([db tableExists:TableAllData]) {}else{
            NSString *sql = [NSString stringWithFormat:
                             @"CREATE TABLE IF NOT EXISTS %@ ( "
                             "%@ TEXT, "
                             "%@ TEXT, "
                             "%@ TEXT, "
                             "%@ TEXT, "
                             "%@ TEXT, "
                             "%@ TEXT, "
                             "%@ TEXT, "
                             "%@ TEXT"
                             " ); ",
                             TableAllData,
                             Tablename,
                             Tablesex,
                             Tableschool,
                             Tablezhuanye,
                             Tablephone,
                             Tableshoukenainji,
                             Tableprice,
                             TabletyepeKe
                             ];
            if (self.isShowDebugLog) {
                NSLog(@"%@",sql);
            }
            BOOL result = [db executeUpdate:sql];
            
            if (result) {
                if (self.isShowDebugLog) {
                    NSLog(@"create TableCity success");
                }
            } else {
                if (self.isShowDebugLog) {
                    NSLog(@"create TableCity failed");
                }
            }
        }
    }];
}

// 3.添加数据
- (void)insertCityDataInTable:(TEListModel *)model {
    
    __block BOOL whoopsSomethingWrongHappened = true;
    [_dbQueue inDatabase:^(FMDatabase * _Nonnull db) {
        [db setShouldCacheStatements:YES];
        db.logsErrors = YES;
        NSString *insertSql = [NSString stringWithFormat:@"INSERT INTO %@ ( "
                               "%@, "
                               "%@, "
                               "%@, "
                               "%@, "
                               "%@, "
                               "%@, "
                               "%@, "
                               "%@ "
                               " ) VALUES(?,?,?,?,?,?,?,?); ",
                               TableAllData,
                               Tablename,
                               Tablesex,
                               Tableschool,
                               Tablezhuanye,
                               Tablephone,
                               Tableshoukenainji,
                               Tableprice,
                               TabletyepeKe
                               ];
        whoopsSomethingWrongHappened = [db executeUpdate:insertSql,
                                        model.name,
                                        model.sex,
                                        model.school,
                                        model.zhuanye,
                                        model.phone,
                                        model.shoukenainji,
                                        model.price,
                                        model.tyepeKe
                                        ];
        if (whoopsSomethingWrongHappened) {
            if (self.isShowDebugLog) {
                NSLog(@"save TableCity success");
            }
        } else {
            if (self.isShowDebugLog) {
                NSLog(@"save TableCity failed");
            }
            return;
        }
    }];
}

// 4.更新数据
- (void)updateCityTable:(TEListModel *)model {
    
    __block BOOL whoopsSomethingWrongHappened = true;
    [_dbQueue inTransaction:^(FMDatabase * _Nonnull db, BOOL * _Nonnull rollback) {
        [db setShouldCacheStatements:YES];
        db.logsErrors = YES;
        NSString* deleteSql = [NSString stringWithFormat:@"DELETE FROM %@ where %@ = ? ;",TableAllData,Tablename];
        whoopsSomethingWrongHappened = [db executeUpdate:deleteSql,model.name];
        if (!whoopsSomethingWrongHappened) {
            if (self.isShowDebugLog) {
                NSLog(@"delete TableCity failed");
            }
        }
        NSString *insertSql = [NSString stringWithFormat:@"INSERT INTO %@ ( "
                               "%@, "
                               "%@, "
                               "%@, "
                               "%@, "
                               "%@, "
                               "%@, "
                               "%@, "
                               "%@ "
                               " ) VALUES(?,?,?,?,?,?,?,?); ",
                               TableAllData,
                               Tablename,
                               Tablesex,
                               Tableschool,
                               Tablezhuanye,
                               Tablephone,
                               Tableshoukenainji,
                               Tableprice,
                               TabletyepeKe
                               ];
        whoopsSomethingWrongHappened = [db executeUpdate:insertSql,
                                        model.name,
                                        model.sex,
                                        model.school,
                                        model.zhuanye,
                                        model.phone,
                                        model.shoukenainji,
                                        model.price,
                                        model.tyepeKe
                                        ];
        if (whoopsSomethingWrongHappened) {
            if (self.isShowDebugLog) {
                NSLog(@"update TableCity success");
            }
        } else {
            if (self.isShowDebugLog) {
                NSLog(@"update TableCity failed");
            }
            *rollback = YES;
            return;
        }
    }];
}

// 5.获取所有数据
- (NSArray<TEListModel *> *)getAllCity {
    
    __block NSMutableArray * modelArray = [NSMutableArray array];
    [_dbQueue inDatabase:^(FMDatabase * _Nonnull db) {
        NSString *selectSql = [NSString stringWithFormat:@"SELECT * FROM %@ ;",TableAllData];
        FMResultSet* resultSet = [db executeQuery:selectSql];
        while ([resultSet next]) {
            NSDictionary *bb = [resultSet resultDictionary];
            if (self.isShowDebugLog) {
                NSLog(@"BB = %@",bb);
            }
            TEListModel* model = [TEListModel mj_objectWithKeyValues:bb];
            [modelArray addObject:model];
        }
        [resultSet close];
    }];
    return [modelArray copy];
}

// 
- (NSArray<TEListModel *> *)getCityWithProvinceCode:(NSString *)provinceCode{
    __block NSMutableArray * modelArray = [NSMutableArray array];
    [_dbQueue inDatabase:^(FMDatabase * _Nonnull db) {
        NSString *selectSql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE %@ = ? ;",TableAllData,Tablename];
        FMResultSet* resultSet = [db executeQuery:selectSql,provinceCode];
        while ([resultSet next]) {
            NSDictionary *bb = [resultSet resultDictionary];
            if (self.isShowDebugLog) {
                NSLog(@"BB = %@",bb);
            }
            TEListModel* model = [TEListModel mj_objectWithKeyValues:bb];// 转模型
            [modelArray addObject:model];
        }
        [resultSet close];
    }];
    return [modelArray copy];
}

//
- (NSString *)getCityCodeWithCityName:(NSString *)cityName {
    TEListModel *model = [self getDataItemWithCityName:cityName];
    return model.name;
}

//
- (TEListModel*)getDataItemWithCityName:(NSString *)cityName {
    
    __block TEListModel * dataModel;
    [_dbQueue inDatabase:^(FMDatabase * _Nonnull db) {
        NSString *selectSql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE %@ = ?;",TableAllData,Tablename];
        FMResultSet* resultSet = [db executeQuery:selectSql,cityName];
        while ([resultSet next]) {
            NSDictionary *bb = [resultSet resultDictionary];
            if (self.isShowDebugLog) {
                NSLog(@"BB = %@",bb);
            }
            dataModel = [TEListModel mj_objectWithKeyValues:bb];
        }
        [resultSet close];
    }];
    return dataModel;
}

//
- (NSString *)getCityNameWithCityCode:(NSString *)cityCode {
    __block NSString * cityName = @"";
    [_dbQueue inDatabase:^(FMDatabase * _Nonnull db) {
        NSString *selectSql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE %@ = ?;",TableAllData,Tablename];
        FMResultSet* resultSet = [db executeQuery:selectSql,cityCode];
        while ([resultSet next]) {
            NSDictionary *bb = [resultSet resultDictionary];
            if (self.isShowDebugLog) {
                NSLog(@"BB = %@",bb);
            }
            TEListModel* model = [TEListModel mj_objectWithKeyValues:bb];
            cityName = model.name;
        }
        [resultSet close];
    }];
    return cityName;
}

#pragma mark 私有函数
-(NSString *)_getAppDocumentPath {
    
    NSArray* lpPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* result = nil;
    
    if([lpPaths count]>0) {
        
        result = [NSString stringWithFormat:@"%@",[lpPaths objectAtIndex:0]];
        BOOL isDirectory = YES;
        
        if (![[NSFileManager defaultManager] fileExistsAtPath:result isDirectory:&isDirectory]) {
            
            [[NSFileManager defaultManager] createDirectoryAtPath:result withIntermediateDirectories:NO attributes:nil error:nil];
        }
        return result;
    } else {
        
        return result;
    }
}

@end
