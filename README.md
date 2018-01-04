# StoryboardUpdateConstraintsDemo
在Storyboard中动态修改约束


效果图：


![示例1](https://github.com/wuyaGit/StoryboardUpdateConstraintsDemo/blob/master/shotScreen.png)


代码：

```
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
        
    // 在cell.contentView中找约束，设置Constant
    [[self class] updateConstraint:[cell contentView] hidden:NO];
}
```

```
+ (void)updateConstraint:(UIView *)view hidden:(BOOL)hidden {
    NSArray *constraints = view.constraints;
    NSUInteger count = [constraints count];
    int index = 0;
    BOOL found = NO;
    while (!found && index < count) {
        NSLayoutConstraint *constraint = constraints[index];
        //遍历约束，找到Identifier=@“nameLabelConstraint”的约束
        if ([constraint.identifier isEqualToString:@"nameLabelConstraint"]) {
            found = YES;
            
            constraint.constant = hidden ? 60.0 : 0.0;
        }
        
        index++;
    }
}
```

详情请见：[简书](https://www.jianshu.com/p/417e3edbbdf4)
