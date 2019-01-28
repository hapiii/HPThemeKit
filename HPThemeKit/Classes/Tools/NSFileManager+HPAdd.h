//
//  NSFileManager+HPAdd.h
//  HPThemeWork
//
//  Created by hapii on 2019/1/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSFileManager (HPAdd)
//传递一个路径和一个时间,返回文件是否超时
-(BOOL)fileWithPath:(NSString*)path TimeOut:(NSTimeInterval)time;
@end

NS_ASSUME_NONNULL_END
