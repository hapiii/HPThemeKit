//
//  HPThemeManager.h
//  HPThemeWork
//
//  Created by hapii on 2019/1/12.
//

#import <Foundation/Foundation.h>
#import "HPThemeModel.h"

typedef NSString CurrectThemeName;



typedef enum{
    
    DownLoadSuccess = 0,
     DownLoadFail = 1,
     HasExit = 2,
    
}downLoadStates;

NS_ASSUME_NONNULL_BEGIN

@interface HPThemeManager : NSObject
///已下载主题名字本地存储
@property(nonatomic,copy)NSString *themePlistPath;
///记录已经下载的主题名称
@property(nonatomic,strong)NSMutableArray*downLoadListArray;

+(instancetype)shareManager;

-(void)downLoadThemeWithTheme:(HPThemeModel *)theme Handle:(void(^)(downLoadStates state))result;
@end

NS_ASSUME_NONNULL_END
