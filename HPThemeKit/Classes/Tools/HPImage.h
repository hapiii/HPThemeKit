//
//  HPImage.h
//  HPThemeWork_Example
//
//  Created by hapii on 2019/1/26.
//  Copyright © 2019年 hapiii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HPColorTable.h"

typedef UIImage *(^HPImagePicker)(DKThemeVersion *themeVersion);

#define HPImagePickerWithKey(key) [HPImage imgPickerWithKey:@#key]



NS_ASSUME_NONNULL_BEGIN

@interface HPImage : NSObject

+ (DKImagePicker)imgPickerWithKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
