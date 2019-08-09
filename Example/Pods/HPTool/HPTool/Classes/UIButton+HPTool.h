//
//  UIButton+HPTool.h
//  HPTool
//
//  Created by hapii on 2019/6/13.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ButtonImageEdgeInsetsStyle) {
    ///image 上 label下
    ButtonImageEdgeInsetsStyleTop = 0,
    ///image左 label右
    ButtonImageEdgeInsetsStyleLeft,
    ///image下 label上
    ButtonImageEdgeInsetsStyleBottom,
    ///image右 label左
    ButtonImageEdgeInsetsStyleRight
};

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (HPTool)



///按钮初始化工厂类
+ (UIButton * (^)(void))hp_create;
- (UIButton * (^)(CGRect ))hp_frame;
- (UIButton * (^)(UIColor *))hp_titleColor;
- (UIButton * (^)(NSString *))hp_title;
- (UIButton * (^)(CGFloat ))hp_font;
- (UIButton * (^)(UIColor *))hp_bgColor;
- (UIButton * (^)(UIImage *))hp_image;
- (UIButton * (^)(CGFloat ))hp_maskRadius;

- (UIButton *(^)(ButtonImageEdgeInsetsStyle edgeInsetsStyle))hp_edgeInsetsStyle:(CGFloat)space;
@end

NS_ASSUME_NONNULL_END
