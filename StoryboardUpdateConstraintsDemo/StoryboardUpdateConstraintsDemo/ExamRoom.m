//
//  ExamRoom.m
//  StoryboardUpdateConstraintsDemo
//
//  Created by YANGGL on 2018/1/4.
//  Copyright © 2018年 YANGGL. All rights reserved.
//

#import "ExamRoom.h"

@implementation ExamRoom

- (instancetype)initWithRoomName:(NSString *)roomName shotDate:(NSString *)shotDate shotState:(NSInteger)shotState {
    if (self = [super init]) {
        self.examRoomName = roomName;
        self.shotDate = shotDate;
        self.shotState = shotState;
    }
    return self;
}

+ (instancetype)examRoomWithName:(NSString *)roomName shotDate:(NSString *)shotDate shotState:(NSInteger)shotState {
    return [[self alloc] initWithRoomName:roomName shotDate:shotDate shotState:shotState];
}

@end
