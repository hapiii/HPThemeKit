//
//  HPThemeModel.m
//  HPThemeWork_Example
//
//  Created by hapii on 2019/1/21.
//  Copyright © 2019年 hapiii. All rights reserved.
//

#import "HPThemeModel.h"
#import <CommonCrypto/CommonDigest.h>

@implementation HPThemeModel

-(instancetype)initWithDatas:(NSDictionary *)data{
    if (self=[super init]) {
        self.themeImgUrl = [NSURL URLWithString:[NSString stringWithFormat:@"http://i.gtimg.cn/qqshow/admindata/comdata/vipThemeNew_item_%@/a.jpg",data[@"baseInfo"][@"id"]]];
        self.themeName= data[@"baseInfo"][@"name"];
        self.themeID = data[@"baseInfo"][@"id"];
        
        //下载地址
        self.themeZipName=[data[@"operationInfo"]lastObject][@"zip"];
        self.themeZipUrl=[NSURL URLWithString:[NSString stringWithFormat:@"http://i.gtimg.cn/qqshow/admindata/comdata/vipThemeNew_item_%@/%@",self.themeID,self.themeZipName]];

        
        self.themeLocalPath = [ThemeFolderPath stringByAppendingString:self.themeName];
        self.themeZipPath = [NSString stringWithFormat:@"%@%@.zip",ThemeFolderPath,self.themeName];
        
        self.themeMD5 = [self md5:self.themeName];
        [self createThemeFolderPath];
    }
    return self;
}




///ThemeFolder 文件夹创建
-(void)createThemeFolderPath{
   
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir = FALSE;
    BOOL isDirExist = [fileManager fileExistsAtPath:ThemeFolderPath isDirectory:&isDir];
    
    if(!(isDirExist && isDir))
    {
        BOOL bCreateDir = [fileManager createDirectoryAtPath:ThemeFolderPath withIntermediateDirectories:YES attributes: nil error:nil];
        if(!bCreateDir){
            NSLog(@"创建主题文件夹失败");
        }
        NSLog(@"创建主题文件夹成功:%@",ThemeFolderPath);
    }
    
    isDir = FALSE;
    isDirExist = [fileManager fileExistsAtPath:ThemeFolderPath isDirectory:&isDir];
    
    if(!(isDirExist && isDir)){
        BOOL bCreateDir = [fileManager createDirectoryAtPath:ThemeFolderPath withIntermediateDirectories:YES attributes:nil error:nil];
        if(!bCreateDir){
            NSLog(@"创建主题文件夹失败");
        }
        NSLog(@"创建主题文件夹成功:%@",ThemeFolderPath);
    }
}

///MD5加密
- (NSString *) md5: (NSString *) inPutText
{
    const char *cStr = [inPutText UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}

@end
