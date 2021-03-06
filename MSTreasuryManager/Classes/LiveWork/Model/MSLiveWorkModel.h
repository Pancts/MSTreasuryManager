//
//  MSLiveWorkModel.h
//  MSTreasuryManager
//
//  Created by 邓利文 on 2016/11/3.
//  Copyright © 2016年 邓利文. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSLiveWorkModel : NSObject

@property (nonatomic, assign) NSInteger workId;

@property (nonatomic, copy) NSString *chargePerson;
@property (nonatomic, copy) NSString *member;
@property (nonatomic, copy) NSString *context;
@property (nonatomic, copy) NSString *workRecord;
@property (nonatomic, copy) NSString *persons;
@property (nonatomic, copy) NSString *attention;
@property (nonatomic, copy) NSString *workTime;
@property (nonatomic, assign) NSInteger sort;

+ (NSArray *)personArrayFromPersonString:(NSString *)personString;

+ (NSString *)personStringFromPersonArray:(NSArray *)personArray;

@end
