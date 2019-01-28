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

@interface HPHomeController ()

@end

@implementation HPHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configTabBarItem];
    self.view.dk_backgroundColorPicker = HPColorPickerWithKey(kTableMenuTextColorSelected);
}
- (void)configTabBarItem
{
    self.tabBarItem.title = @"课程";
    self.tabBarItem.dk_imagePicker = HPImagePickerWithKey(tab_buddy_nor);
    self.tabBarItem.dk_selectedImagePicker = HPImagePickerWithKey(tab_buddy_press);
    [self.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -2.5)];
    self.tabBarItem.imageInsets = UIEdgeInsetsMake(-18.0, 0, 0.5, 0);
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
