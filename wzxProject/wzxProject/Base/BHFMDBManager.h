//
//  BHFMDBManager.h
//  MyApp
//
//  Created by mac on 2019/7/2.
//  Copyright © 2019 Haochuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TEListModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface BHFMDBManager : NSObject {
    
    FMDatabaseQueue *_dbQueue;  // 这个类在多个线程来执行查询和更新时会使用这个类，避免同时访问同一个数据
    FMDatabasePool *_dbPool;// 数据库连接池 减少连接开销（这要明确知道不会同一时刻有多个线程去操作数据库，如果会就是用FMDatabaseQueue）
}

/** 是否显示日志打印*/
@property(nonatomic, assign) BOOL isShowDebugLog;
// 临时存储列表数据
@property(nonatomic, strong) NSMutableArray *characterMutableArray;
@property(nonatomic, strong) NSMutableArray *sectionMutableArray;
@property(nonatomic, strong) NSMutableArray *historyCityMutableArray;
@property(nonatomic, strong) NSMutableArray *cityMutableArray;
@property(nonatomic, strong) NSMutableArray *hotMutableArray;

+ (BHFMDBManager *)shareInstance;

// 创建表
- (void)createTable;
- (NSArray<TEListModel *> *)getAllCity;

// 所有城市添加数据
- (void)insertCityDataInTable:(TEListModel *)model;

// 所有城市更新数据
- (void)updateCityTable:(TEListModel *)model;

- (NSArray<TEListModel *> *)getCityWithProvinceCode:(NSString *)provinceCode;
- (NSString *)getCityCodeWithCityName:(NSString *)cityName;
- (TEListModel*)getDataItemWithCityName:(NSString *)cityName;
- (NSString *)getCityNameWithCityCode:(NSString *)cityCode;

@end

NS_ASSUME_NONNULL_END
