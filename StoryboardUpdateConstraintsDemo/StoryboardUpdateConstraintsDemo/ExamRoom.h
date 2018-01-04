//
//  ExamRoom.h
//  StoryboardUpdateConstraintsDemo
//
//  Created by YANGGL on 2018/1/4.
//  Copyright © 2018年 YANGGL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExamRoom : NSObject

@property (nonatomic, copy) NSString *examRoomName;
@property (nonatomic, copy) NSString *shotDate;               //拍摄时间
@property (nonatomic, assign) NSInteger shotState;           //拍摄状态，0—未拍摄，1—已拍摄

- (instancetype)initWithRoomName:(NSString *)roomName shotDate:(NSString *)shotDate shotState:(NSInteger)shotState;
+ (instancetype)examRoomWithName:(NSString *)roomName shotDate:(NSString *)shotDate shotState:(NSInteger)shotState;


@end
