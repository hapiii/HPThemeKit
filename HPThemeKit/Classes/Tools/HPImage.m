//
//  HPImage.m
//  HPThemeWork_Example
//
//  Created by hapii on 2019/1/26.
//  Copyright © 2019年 hapiii. All rights reserved.
//

#import "HPImage.h"
#import "HPThemeBundleHelper.h"


@implementation HPImage

+ (DKImagePicker)pickerWithKey:(NSString *)key {
    HPColorTable *colorTable = [HPColorTable sharedColorTable];
    NSParameterAssert(colorTable.imagesFilePath);
    
    return ^(DKThemeVersion *themeVersion) {
        //默认
        if (IS_Empty_String(colorTable.imagesFilePath)) {
            return [UIImage imageNamed:key inBundle:[HPThemeBundleHelper frameworkBundle] compatibleWithTraitCollection:nil];
        }
        //沙盒
        UIImage *img = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",colorTable.imagesFilePath,key]];
        if (img) {
            return img;
        }else{
            CGRect rect=CGRectMake(0.0f, 0.0f,1,1);
            UIGraphicsBeginImageContext(rect.size);
            CGContextRef context = UIGraphicsGetCurrentContext();
            CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
            CGContextFillRect(context, rect);
            UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            return theImage;
        }
    };
}




@end
