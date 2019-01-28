//
//  HPNewsController.m
//  HPThemeWork_Example
//
//  Created by hapii on 2019/1/13.
//  Copyright © 2019年 hapiii. All rights reserved.
//

#import "HPNewsController.h"


@interface HPNewsController ()

@end

@implementation HPNewsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.dk_backgroundColorPicker = [[HPColorTable sharedColorTable] pickerWithKey:@"kTableViewCellUnreadBackgroundColorNormal"];
    // Do any additional setup after loading the view.
   // [self configTabBarItem];
    // Do any additional setup after loading the view.
}
- (void)configTabBarItem
{
    self.tabBarItem.title = @"课程";
    self.tabBarItem.dk_imagePicker = HPImagePickerWithKey(tab_call_nor);
     self.iv.dk_imagePicker = HPImagePickerWithKey(tab_call_nor);
    self.tabBarItem.dk_selectedImagePicker = HPImagePickerWithKey(tab_call_press);
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
