//
//  HPThemeBundleHelper.m
//  HPThemeKit_Example
//
//  Created by hapii on 2019/1/28.
//  Copyright © 2019 hapiii. All rights reserved.
//

#import "HPThemeBundleHelper.h"

@implementation HPThemeBundleHelper
+ (NSBundle *)frameworkBundle
{
    static NSBundle *frameworkBundle = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        NSBundle *sliderBundle = [NSBundle bundleForClass:[self class]];
        NSString *resourceBundlePath = [[sliderBundle bundlePath] stringByAppendingPathComponent:@"HPThemeKit.bundle"];
        frameworkBundle = [NSBundle bundleWithPath:resourceBundlePath];
    });
    return frameworkBundle;
}

@end
