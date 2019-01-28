//
//  HPThemeModel.h
//  HPThemeWork_Example
//
//  Created by hapii on 2019/1/21.
//  Copyright © 2019年 hapiii. All rights reserved.
//

#import <Foundation/Foundation.h>


#define THEME @"theme"

#define LibraryPath [NSString stringWithFormat:@"%@",[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject]]

#define ThemeFolderPath  [LibraryPath stringByAppendingString:@"/Theme/"]

#define IS_Empty_String(str) (str==nil||[str isEqualToString:@""]||[str isEqualToString:@"nil"])

NS_ASSUME_NONNULL_BEGIN

@interface HPThemeModel : NSObject
///图片URL
@property(nonatomic,strong)NSURL *themeImgUrl;
///主题名字
@property(nonatomic,copy)NSString *themeName;
///主题zip包名字
@property(nonatomic,copy)NSString *themeZipName;
///zip包本地存放地址
@property(nonatomic,copy)NSString *themeZipPath;
///zip包下载地址
@property(nonatomic,strong)NSURL *themeZipUrl;
///主题版本
@property(nonatomic,copy)NSString *themeVerson;
///主题ID
@property(nonatomic,copy)NSString *themeID;
///主题本地存储路径
@property(nonatomic,copy)NSString *themeLocalPath;
///MD5
@property(nonatomic,copy)NSString *themeMD5;

///parser to model
-(instancetype)initWithDatas:(NSDictionary *)data;


@end

NS_ASSUME_NONNULL_END
