//
//  HPThemeManager.m
//  HPThemeWork
//
//  Created by hapii on 2019/1/12.
//

#import "HPThemeManager.h"
#import <SSZipArchive/SSZipArchive.h>
#import "HPColorTable.h"


static HPThemeManager *manager=nil;

@implementation HPThemeManager

+(instancetype)shareManager{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager=[[HPThemeManager alloc]init];
        manager.themePlistPath = [NSString stringWithFormat:@"%@dowloadTheme.plist",ThemeFolderPath];
        manager.downLoadListArray=[NSMutableArray arrayWithContentsOfFile:manager.themePlistPath];
        //如果为nil,先进行初始化
        if (manager.downLoadListArray==nil) {
            manager.downLoadListArray=[NSMutableArray array];
        }
    });
    return manager;
}

-(void)downLoadThemeWithTheme:(HPThemeModel *)theme Handle:(void(^)(downLoadStates state))result{
    
    if ([self.downLoadListArray containsObject:theme.themeName]) {
        [self changeTheme:theme];
        result(HasExit);
       
    }else{
        
        NSError *error = nil;
        NSData *data = [NSData dataWithContentsOfURL:theme.themeZipUrl options:0 error:&error];
        if(!error)
        {
            [data writeToFile:theme.themeZipPath atomically:YES];
            [self unzipWithFilePath:theme.themeZipPath destinationPath:ThemeFolderPath unzipFileName:theme.themeName Handle:^(BOOL isSussess, NSError *error) {
                if (isSussess) {
                    [self changeTheme:theme];
                    [self.downLoadListArray addObject:theme.themeName];
                    [self.downLoadListArray writeToFile:self.themePlistPath atomically:YES];
                    result(DownLoadSuccess);
                }else{
                    result(DownLoadFail);
                }
            }];
        
        }else{
           result(DownLoadFail);
        }
  }
    
}

///切换主题
-(void)changeTheme:(HPThemeModel *)theme{
    
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    [user setObject:theme.themeName forKey:THEME];
    [user synchronize];
    [HPColorTable sharedColorTable].file = [theme.themeLocalPath stringByAppendingString:@"/ThemeConfig.plist"];
    [HPColorTable sharedColorTable].imagesFilePath = theme.themeLocalPath;
    [[NSNotificationCenter defaultCenter] postNotificationName:DKNightVersionThemeChangingNotification
                                                        object:nil];
    
}

///解压
- (void)unzipWithFilePath:(NSString *)filePath destinationPath:(NSString *)destinationPath unzipFileName:(NSString *)fileName Handle:(void (^)(BOOL isSussess, NSError *error)) resultHandler {
    
    NSString *unzipPath = [destinationPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@-unzip", fileName]];
    NSString *unzipCompletePath = [destinationPath stringByAppendingPathComponent:fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];

    if (![fileManager fileExistsAtPath:destinationPath]) {
        NSError *error = nil;
        [fileManager createDirectoryAtPath:destinationPath withIntermediateDirectories:YES attributes:nil error:&error];
        if (error) {
            resultHandler(NO,error);
        }
    }
                           
    [SSZipArchive unzipFileAtPath:filePath toDestination:unzipPath progressHandler:^(NSString * _Nonnull entry, unz_file_info zipInfo, long entryNumber, long total) {
    } completionHandler:^(NSString * _Nonnull path, BOOL succeeded, NSError * _Nullable error) {
        if (!succeeded) {
            [[NSFileManager defaultManager] removeItemAtPath:unzipPath
                                                       error:nil];
            resultHandler(NO,error);
           
        } else {
            NSError * error = nil;
            [[NSFileManager defaultManager] moveItemAtPath:unzipPath
                                                    toPath:unzipCompletePath
                                                     error:&error];
            [[NSFileManager defaultManager] removeItemAtPath:filePath
                                                       error:nil];
            
            if (error) {
                resultHandler(NO,error);
            } else {
                resultHandler(YES,nil);
            }
        }
    }];

}



@end
