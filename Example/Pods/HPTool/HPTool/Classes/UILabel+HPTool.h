//
//  UILabel+HPTool.h
//  HPTool
//
//  Created by hapii on 2019/6/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (HPTool)

@property (nonatomic, assign) BOOL hp_isPlaceHolder;

+ (UILabel *(^)(void))hp_create;
- (UILabel *(^)(CGRect ))hp_frame;
- (UILabel *(^)(CGFloat ))hp_font;
- (UILabel *(^)(UIColor *))hp_textColor;
- (UILabel *(^)(NSTextAlignment))hp_textAlignment;
- (UILabel *(^)(NSString *))hp_text;
- (UILabel *(^)(NSInteger ))hp_numberOfLines;

@end

NS_ASSUME_NONNULL_END
