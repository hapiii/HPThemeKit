//
//  HPAppDelegate.m
//  HPThemeKit
//
//  Created by hapiii on 01/28/2019.
//  Copyright (c) 2019 hapiii. All rights reserved.
//

#import "HPAppDelegate.h"
#import "HPTabbarController.h"

@implementation HPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor]; //给window设置一个背景色
    HPTabbarController *vc = [[HPTabbarController alloc] init];
    self.window.rootViewController = vc;
    self.window.rootViewController.view.alpha = 1.0;
    [self.window makeKeyAndVisible];
    //[self setupTabsController];
    // Override point for customization after application launch.
    return YES;
}
- (void)setupTabsController
{
    UITabBarController *tabbarController = UITabBarController.new;
    
    
    
    
    
    //Tabbar初始化
    NSArray *tabConfig;
    
    tabConfig = @[@{@"id": @(001), @"class": @"HPHomeController"},
                  @{@"id": @(002), @"class": @"HPNewsController"},
                  @{@"id": @(003), @"class": @"HPCardsController"},
                  @{@"id": @(004), @"class": @"HPUserController"}];
    
    
    NSMutableArray *tabControllers = [NSMutableArray arrayWithCapacity:0];
    for (NSInteger i = 0; i < tabConfig.count; i++) {
        NSDictionary *tabInfo = [tabConfig objectAtIndex:i];
        //NSString *tabID = [tabInfo valueForKey:@"id"];
        NSString *className = [tabInfo valueForKey:@"class"];
        
        UIViewController *tabController = [[NSClassFromString(className) alloc] init];
        if (tabController) {
            [tabControllers addObject:[[UINavigationController alloc] initWithRootViewController:tabController]];
        }
    }
    
    //tabbarController.delegate = self;
    tabbarController.viewControllers = tabControllers;
    
    self.window.rootViewController = tabbarController;
    self.window.rootViewController.view.alpha = 1.0;
    [self.window makeKeyAndVisible];
    
    
    tabbarController.selectedIndex = 0;
    
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
