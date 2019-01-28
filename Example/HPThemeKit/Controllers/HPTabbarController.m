//
//  HPTabbarController.m
//  HPThemeKit_Example
//
//  Created by hapii on 2019/1/28.
//  Copyright © 2019 hapiii. All rights reserved.
//

#import "HPTabbarController.h"
#import "HPHomeController.h"
#import "HPCardsController.h"
#import "HPNewsController.h"
#import "HPUserController.h"

@interface HPTabbarController ()

@end

@implementation HPTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setup];
    
    // Do any additional setup after loading the view.
}

- (void)setup {
    
    //
    //    [[UITabBarItem appearance]setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor clearColor],NSForegroundColorAttributeName,nil]forState:UIControlStateSelected];
    //    [[UITabBarItem appearance]setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor clearColor],NSForegroundColorAttributeName,nil]forState:UIControlStateNormal];
    
    
    
    HPHomeController *home= [HPHomeController new];
    HPCardsController *market= [HPCardsController new];
    HPNewsController *trad= [HPNewsController new];
    HPUserController *order= [HPUserController new];
   
    
    
    self.viewControllers = @[home,market,trad,order];
    
    
    [self addChildViewController:home imageName:@"tab_buddy_nor" selectedImageName:@"tab_buddy_press" title:@"首页"];
    [self addChildViewController:market imageName:@"tab_qworld_nor" selectedImageName:@"tab_qworld_press" title:@"行情"];
    [self addChildViewController:trad imageName:@"tab_recent_nor" selectedImageName:@"tab_recent_press" title:@"交易"];
    [self addChildViewController:order imageName:@"tab_recent_nor" selectedImageName:@"tab_recent_press" title:@"订单"];
    
    
    // this make tabBaController call
    
    
    
    
}


- (void)addChildViewController:(UIViewController *)childController imageName:(NSString *)normalImg selectedImageName:(NSString *)selectImg title:(NSString *)title {
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childController];
    childController.tabBarItem.dk_imagePicker = [HPImage imgPickerWithKey:normalImg];
    childController.tabBarItem.dk_selectedImagePicker = [HPImage imgPickerWithKey:selectImg];
    childController.navigationItem.title = title;
    childController.tabBarItem.title = title;
    [childController.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -2.5)];
    childController.tabBarItem.imageInsets = UIEdgeInsetsMake(-18.0, 0, 0.5, 0);
   
    [self addChildViewController:nav];
}





@end
