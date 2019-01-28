//
//  UITabBarItem+Night.h
//  HPThemeKit
//
//  Created by hapii on 2019/1/28.
//

#import <UIKit/UIKit.h>
#import <DKNightVersion/DKNightVersionManager.h>
#import "NSObject+Night.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITabBarItem (Night)

@property (nullable, nonatomic, copy, setter = dk_setImagePicker:) DKImagePicker dk_imagePicker;
@property (nullable, nonatomic, copy, setter = dk_setSelectedImagePicker:) DKImagePicker dk_selectedImagePicker;

@end

NS_ASSUME_NONNULL_END
