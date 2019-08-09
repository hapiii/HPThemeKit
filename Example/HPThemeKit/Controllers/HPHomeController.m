//
//  HPHomeController.m
//  HPThemeWork_Example
//
//  Created by hapii on 2019/1/13.
//  Copyright © 2019年 hapiii. All rights reserved.
//

#import "HPHomeController.h"
#import "HPThemeManager.h"
#import "DKNightVersion.h"
#import "HPColorTable.h"
#import <HPTool/HPTool.h>
#import <DKNightVersion/DKNightVersion.h>
#import <SDWebImage/SDWebImage.h>

@interface HPHomeController ()

@end

@implementation HPHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
   // [self configTabBarItem];
    self.view.dk_backgroundColorPicker = HPColorPickerWithKey(kTableMenuTextColorSelected);
    
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, KScreenWidth/2,200)];
    
    [self.view addSubview:iv];
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(KScreenWidth/2, 100, KScreenWidth/2-40, 300)];
    lab.numberOfLines = 0;
    lab.backgroundColor = [UIColor greenColor];
    [self.view addSubview:lab];
    
    UILabel *labTw = UILabel.hp_create()
    .hp_frame(CGRectMake(20, 400, KScreenWidth-40, 300));
    labTw.numberOfLines = 0;
    [self.view addSubview:labTw];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [iv sd_setImageWithURL:[NSURL URLWithString:@"https://static.oschina.net/uploads/space/2019/0606/065545_c8yF_2720166.jpg"]];
        lab.text = @"知名游戏设计师兼程序员 Jason Rohrer 昨天正好遭遇了上述的情况，为此他在推特“吐槽”了一番，并说道，在没有收到任何警告和通知的情况下，他使用了 5 年的 GitHub 帐号（包含 5000 个 commit 和 23 个仓库）被官方屏蔽了，其中最重要的一个 repo —— 托管在 GitHub 已超过 5 年并十分活跃的《One Hour One Life》开源游戏 repo 也未能幸免。";
        labTw.text = @"对此，Jason 刚开始猜测是某些用户为泄恨而进行的恶意举报导致被 GitHub 屏蔽了帐号。Jason 表示，自己使用了 GitHub 的一些服务来运行《One Hour One Life》，但没想到对方提供的服务竟然如此不专业。上个月被 Discord 坑了一把，这个月就轮到了 GitHub。他认为既然 GitHub 将自己定位成行业“基石”，那么一举一动也要表现出作为“基石”所应具备的素质。";
    });
    
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
