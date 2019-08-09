//
//  HPTool.h
//  HPTool
//
//  Created by hapii on 2019/6/13.
//

#import <Foundation/Foundation.h>

#if __has_include(<HPTool/HPTool.h>)

FOUNDATION_EXPORT double HPToolVersionNumber;
FOUNDATION_EXPORT const unsigned char HPToolVersionString[];

#import <HPTool/UIButton+HPTool.h>
#import <HPTool/UILabel+HPTool.h>

#else

#import "HPTool/UIButton+HPTool.h"
#import "HPTool/UILabel+HPTool.h"

#endif
