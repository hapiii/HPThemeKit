//
//  UILabel+HPTool.m
//  HPTool
//
//  Created by hapii on 2019/6/13.
//

#import "UILabel+HPTool.h"
#import <objc/runtime.h>

static NSString *nameWithSetterGetterKey = @"nameWithSetterGetterKey";

@implementation UILabel (HPTool)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class selfClass = object_getClass([self class]);
        
        SEL oriSEL = @selector(init);
        Method oriMethod = class_getInstanceMethod(selfClass, oriSEL);
        
        SEL cusSEL = @selector(init_HpText);
        Method cusMethod = class_getInstanceMethod(selfClass, cusSEL);
        
        BOOL addSucc = class_addMethod(selfClass, oriSEL, method_getImplementation(cusMethod), method_getTypeEncoding(cusMethod));
        if (addSucc) {
            class_replaceMethod(selfClass, cusSEL, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
        }else {
            method_exchangeImplementations(oriMethod, cusMethod);
        }
        
        SEL oriSetSEL = @selector(setText:);
        Method oriSetMethod = class_getInstanceMethod(selfClass, oriSEL);
        
        SEL cusSetSEL = @selector(hp_setText:);
        Method cusSetMethod = class_getInstanceMethod(selfClass, cusSEL);
        
        BOOL addSetSucc = class_addMethod(selfClass, oriSetSEL, method_getImplementation(cusSetMethod), method_getTypeEncoding(cusSetMethod));
        if (addSetSucc) {
            class_replaceMethod(selfClass, cusSetSEL, method_getImplementation(oriSetMethod), method_getTypeEncoding(oriSetMethod));
        }else {
            method_exchangeImplementations(oriSetMethod, cusSetMethod);
        }
        
    });
}

- (instancetype)init_HpText{

    if (self = [super init]) {
        self.hp_isPlaceHolder = YES;
    }
    return  self;
}

-(void)hp_setText:(NSString *)text{
    self.text = text;
    self.hp_isPlaceHolder = NO;
    
}

- (void)setHp_isPlaceHolder:(BOOL)hp_isPlaceHolder{
    
    objc_setAssociatedObject(self, &nameWithSetterGetterKey, @(hp_isPlaceHolder), OBJC_ASSOCIATION_COPY);
    if (hp_isPlaceHolder) {
        self.backgroundColor = [UIColor redColor];
    }else{
        self.backgroundColor = [UIColor clearColor];
    }
}

- (BOOL)hp_isPlaceHolder{
    return objc_getAssociatedObject(self, &nameWithSetterGetterKey);
}

+ (UILabel *(^)(void))hp_create{
    return ^(void){
        UILabel *lab =[[UILabel alloc] init];
         return lab;
    };
}

- (UILabel *(^)(CGRect ))hp_frame{
    return  ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UILabel *(^)(CGFloat ))hp_font{
    return ^(CGFloat fontFloat){
        UIFont *font = [UIFont systemFontOfSize:fontFloat];
        self.font = font;
        return self;
    };
}

- (UILabel *(^)(UIColor *))hp_textColor{
    return ^(UIColor *textColor){
        self.textColor = textColor;
        return self;
    };
}

- (UILabel *(^)(NSTextAlignment))hp_textAlignment{
    return ^(NSTextAlignment textAlignment){
        self.textAlignment = textAlignment;
        return self;
    };
}

- (UILabel *(^)(NSString *))hp_text{
    return ^(NSString *text){
        self.text = text;
        return self;
    };
}

- (UILabel *(^)(NSInteger ))hp_numberOfLines{
    
    return ^(NSInteger numberOfLines){
        self.numberOfLines = numberOfLines;
        return self;
    };
}

@end
