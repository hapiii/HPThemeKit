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
    
    UIButton *but = [[UIButton alloc] initWithFrame:CGRectMake(100,100, 40, 40)];
    but.backgroundColor = [UIColor redColor];
    [self.view addSubview:but];
    [but addTarget:self action:@selector(goToTheme) forControlEvents:UIControlEventTouchUpInside];
   
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(100, floor(CGRectGetMaxY(but.frame)), 200, 200)];
    img.dk_backgroundColorPicker = HPColorPickerWithKey(kSearchBarCancelButtonTitleColorNormal);
    img.dk_imagePicker = HPImagePickerWithKey(aio_shortcut_flash_picture);
    [self.view addSubview:img];
    
    UIImageView *img2 = [[UIImageView alloc] initWithFrame:CGRectMake(100, floor(CGRectGetMaxY(img.frame)), 200, 200)];
    img2.dk_backgroundColorPicker = HPColorPickerWithKey(kSearchBarCancelButtonTitleColorNormal);
    img2.dk_imagePicker = HPImagePickerWithKey(chat_bottom_red_pack_press@3x);
    [self.view addSubview:img2];
    
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
