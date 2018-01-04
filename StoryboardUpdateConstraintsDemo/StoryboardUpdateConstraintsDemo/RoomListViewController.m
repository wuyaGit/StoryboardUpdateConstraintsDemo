//
//  RoomListViewController.m
//  StoryboardUpdateConstraintsDemo
//
//  Created by YANGGL on 2018/1/4.
//  Copyright © 2018年 YANGGL. All rights reserved.
//

#import "RoomListViewController.h"
#import "ExamRoom.h"

@interface RoomListViewController ()

@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation RoomListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 92.f;

    self.dataArray = @[[ExamRoom examRoomWithName:@"西门大厦36栋广角大街366公寓教学楼201" shotDate:@"2018-1-2 10:10" shotState:0],
                       [ExamRoom examRoomWithName:@"西门大厦36栋广角大街366公寓教学楼202" shotDate:@"2018-1-1 10:10" shotState:0],
                       [ExamRoom examRoomWithName:@"西门大厦36栋广角大街366公寓教学楼203" shotDate:@"2017-12-2 10:10" shotState:0],
                       [ExamRoom examRoomWithName:@"西门大厦36栋广角大街366公寓教学楼204" shotDate:@"2017-11-12 10:10" shotState:1],
                       [ExamRoom examRoomWithName:@"西门大厦36栋广角大街366公寓教学楼205" shotDate:@"2017-12-22 10:10" shotState:1],
                       [ExamRoom examRoomWithName:@"西门大厦36栋广角大街366公寓教学楼206" shotDate:@"2018-1-1 10:10" shotState:0],
                       [ExamRoom examRoomWithName:@"西门大厦36栋广角大街366公寓教学楼207" shotDate:@"2018-1-8 10:10" shotState:1],
                       [ExamRoom examRoomWithName:@"西门大厦36栋广角大街366公寓教学楼208" shotDate:@"2018-1-4 10:10" shotState:1]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (void)updateConstraint:(UIView *)view hidden:(BOOL)hidden {
    NSArray *constraints = view.constraints;
    NSUInteger count = [constraints count];
    int index = 0;
    BOOL found = NO;
    while (!found && index < count) {
        NSLayoutConstraint *constraint = constraints[index];
        if ([constraint.identifier isEqualToString:@"nameLabelConstraint"]) {
            found = YES;
            
            constraint.constant = hidden ? 60.0 : 0.0;
        }
        
        index++;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"examRoomCell" forIndexPath:indexPath];
    [cell viewWithTag:10].layer.borderWidth = 1;
    [cell viewWithTag:10].layer.borderColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1].CGColor;

    ExamRoom *examRoom = self.dataArray[indexPath.row];
    ((UILabel *)[cell viewWithTag:11]).text = [NSString stringWithFormat:@"%@", @(indexPath.row + 1)];
    ((UILabel *)[cell viewWithTag:12]).text = examRoom.examRoomName;
    ((UILabel *)[cell viewWithTag:13]).text = examRoom.shotState ? @"已拍摄" : @"未拍摄";
    ((UILabel *)[cell viewWithTag:14]).text = examRoom.shotState ? [NSString stringWithFormat:@"拍摄时间：%@", examRoom.shotDate] : @"" ;

    if (examRoom.shotState) {
        ((UIButton *)[cell viewWithTag:15]).hidden = YES;  //上传按钮
        ((UIButton *)[cell viewWithTag:16]).hidden = NO;   //查看
        ((UIButton *)[cell viewWithTag:17]).hidden = NO;   //拍摄/重拍
        [((UIButton *)[cell viewWithTag:17]) setTitle:@"重拍" forState:UIControlStateNormal];
        
        [[self class] updateConstraint:[cell contentView] hidden:YES];
    }else {
        ((UIButton *)[cell viewWithTag:15]).hidden = YES;
        ((UIButton *)[cell viewWithTag:16]).hidden = YES;
        ((UIButton *)[cell viewWithTag:17]).hidden = NO;
        [((UIButton *)[cell viewWithTag:17]) setTitle:@"拍摄" forState:UIControlStateNormal];
        
        [[self class] updateConstraint:[cell contentView] hidden:NO];
    }
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
