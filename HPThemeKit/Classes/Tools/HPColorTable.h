//
//  HPColorTable.h
//  HPThemeWork_Example
//
//  Created by hapii on 2019/1/25.
//  Copyright © 2019年 hapiii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HPThemeManager.h"
#import <DKNightVersion/DKNightVersionManager.h>
#define HPColorPickerWithKey(key) [[HPColorTable sharedColorTable] pickerWithKey:@#key]

NS_ASSUME_NONNULL_BEGIN

@interface HPColorTable : NSObject

///table存储位置,set时刷新table
@property (nonatomic, strong) NSString *file;
///图片主题路径
@property (nonatomic,strong) NSString *imagesFilePath;

+ (instancetype)sharedColorTable;


- (void)reloadColorTable;


- (DKColorPicker)pickerWithKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
