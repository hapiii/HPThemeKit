//
//  HPUserController.m
//  HPThemeWork_Example
//
//  Created by hapii on 2019/1/13.
//  Copyright © 2019年 hapiii. All rights reserved.
//

#import "HPUserController.h"
#import "HPThemeController.h"
#import "HPImage.h"

@interface HPUserController ()

@end

@implementation HPUserController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.dk_backgroundColorPicker = HPColorPickerWithKey(kTextFieldTextColor);
    
    UIButton *but = [[UIButton alloc] initWithFrame:CGRectMake(100,100, 200, 40)];
    [but setTitle:@"切换皮肤" forState:UIControlStateNormal];
    [but dk_setBackgroundColorPicker:HPColorPickerWithKey(kTabBarItemTitleColorNormal)];
    [but dk_setTitleColorPicker:HPColorPickerWithKey(kTableMenuTextColorSelected) forState:UIControlStateNormal];
    [self.view addSubview:but];
    [but addTarget:self action:@selector(goToTheme) forControlEvents:UIControlEventTouchUpInside];
   
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(100, floor(CGRectGetMaxY(but.frame)), 200, 200)];
    img.dk_backgroundColorPicker = HPColorPickerWithKey(kSearchBarCancelButtonTitleColorNormal);
    img.dk_imagePicker = HPImagePickerWithKey(aio_shortcut_flash_picture);
    [self.view addSubview:img];
    
    UIImageView *img2 = [[UIImageView alloc] initWithFrame:CGRectMake(100, floor(CGRectGetMaxY(img.frame)), 200, 200)];
    img2.dk_backgroundColorPicker = HPColorPickerWithKey(kSearchBarCancelButtonTitleColorNormal);
    img2.dk_imagePicker = HPImagePickerWithKey(chat_bottom_red_pack_press);
    [self.view addSubview:img2];
    
//    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(100, floor(CGRectGetMaxY(img2.frame)), 200, 50)];
//    lab.dk_tintColorPicker = HPColorPickerWithKey(kTableMenuTextColorSelected);
//    lab.dk_textColorPicker = HPColorPickerWithKey(kCommonBlueButtonTitleColorHighlighted);
//    lab.text = @"煮鱼不加香菜";
//    [self.view addSubview:lab];
  
}


-(void)goToTheme{
    HPThemeController *themeVC = [[HPThemeController alloc] init];
    themeVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:themeVC animated:YES];
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
