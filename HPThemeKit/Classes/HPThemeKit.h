//
//  HPThemeKit.h
//  HPThemeKit
//
//  Created by hapii on 2019/1/28.
//  Copyright © 2019 hapiii. All rights reserved.
//
#if __has_include(<HPThemeKit/HPTmemeKit.h>)

FOUNDATION_EXPORT double HPThemeKitVersionNumber;
FOUNDATION_EXPORT const unsigned char HPThemeKitVersionString[];

#import <HPThemeKit/HPColorTable.h>
#import <HPThemeKit/HPImage.h>
#import <HPThemeKit/HPThemeManager.h>
#import <HPThemeKit/HPThemeModel.h>
#import <HPThemeKit/HttpDownLoad.h>
#import <HPThemeKit/HPThemeBundleHelper.h>


#else

#import "HPColorTable.h"
#import "HPImage.h"
#import "HPThemeManager.h"
#import "HPThemeModel.h"
#import "HttpDownLoad.h"
#import "HPThemeBundleHelper.h"

#endif

