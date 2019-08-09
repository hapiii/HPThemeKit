//
//  UIButton+HPTool.m
//  HPTool
//
//  Created by hapii on 2019/6/13.
//

#import "UIButton+HPTool.h"

@implementation UIButton (HPTool)





+ (UIButton * (^)(void))hp_create{
    return ^(void){
        UIButton *btn = [[UIButton alloc] init];
        return btn;
    };
}

- (UIButton * (^)(CGRect ))hp_frame{
    return  ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UIButton * (^)(UIColor *))hp_titleColor{
    return  ^(UIColor *color){
        [self setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
}

-(UIButton * (^)(NSString *))hp_title{
    return  ^(NSString *title){
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton * (^)(CGFloat ))hp_font{
    return  ^(CGFloat font){
        self.titleLabel.font = [UIFont systemFontOfSize:font];
        return self;
    };
}

-(UIButton * (^)(UIColor *))hp_bgColor{
    return  ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

- (UIButton * (^)(UIImage *))hp_image{
    return  ^(UIImage *image){
        [self setImage:image forState:UIControlStateNormal];
        [self setImage:image forState:UIControlStateSelected];
        [self setImage:image forState:UIControlStateHighlighted];
        return self;
    };
}

- (UIButton * (^)(CGFloat ))hp_maskRadius{
    return  ^(CGFloat cornerRadius){
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = cornerRadius;
        return self;
    };
}

- (UIButton *(^)(ButtonImageEdgeInsetsStyle edgeInsetsStyle))hp_edgeInsetsStyle:(CGFloat)space{
    
    return ^ (ButtonImageEdgeInsetsStyle edgeInsetsStyle){
        //获取imageView和titleLabel的宽、高
        CGFloat imageWith = self.imageView.frame.size.width;
        CGFloat imageHeight = self.imageView.frame.size.height;
        
        CGFloat labelWidth = 0.0;
        CGFloat labelHeight = 0.0;
        if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) { //iOS8中titleLabel的size为0，用下面的这种设置
            labelWidth = self.titleLabel.intrinsicContentSize.width;
            labelHeight = self.titleLabel.intrinsicContentSize.height;
        } else {
            labelWidth = self.titleLabel.frame.size.width;
            labelHeight = self.titleLabel.frame.size.height;
        }
        
        UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
        UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
        
        switch (edgeInsetsStyle) {
            case ButtonImageEdgeInsetsStyleTop:
            {
                imageEdgeInsets = UIEdgeInsetsMake(-labelHeight - space * 0.5, 0, 0, -labelWidth);
                labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight - space * 0.5, 0);
            }
                break;
            case ButtonImageEdgeInsetsStyleLeft:
            {
                imageEdgeInsets = UIEdgeInsetsMake(0, -space * 0.5, 0, space * 0.5);
                labelEdgeInsets = UIEdgeInsetsMake(0, space * 0.5, 0, -space * 0.5);
            }
                break;
            case ButtonImageEdgeInsetsStyleBottom:
            {
                imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight - space * 0.5, -labelWidth);
                labelEdgeInsets = UIEdgeInsetsMake(-imageHeight - space* 0.5, -imageWith, 0, 0);
            }
                break;
            case ButtonImageEdgeInsetsStyleRight:
            {
                imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + space * 0.5, 0, -labelWidth - space * 0.5);
                labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith - space * 0.5, 0, imageWith+space * 0.5);
            }
                break;
            default:
                break;
        }
        
        self.titleEdgeInsets = labelEdgeInsets;
        self.imageEdgeInsets = imageEdgeInsets;
        return self;
    };
}



@end
