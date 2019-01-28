//
//  UITabBarItem+Night.m
//  HPThemeKit
//
//  Created by hapii on 2019/1/28.
//

#import "UITabBarItem+Night.h"
#import <objc/runtime.h>

@interface NSObject ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *pickers;

@end

@implementation UITabBarItem (Night)

- (DKImagePicker)dk_imagePicker {
    return objc_getAssociatedObject(self, @selector(dk_imagePicker));
}

- (void)dk_setImagePicker:(DKImagePicker)picker {
    objc_setAssociatedObject(self, @selector(dk_imagePicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.image = [picker(self.dk_manager.themeVersion) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self.pickers setValue:[picker copy] forKey:@"setImage:"];
    
}
-(DKImagePicker )dk_selectedImagePicker{
    return objc_getAssociatedObject(self, @selector(dk_selectedImagePicker));
}

- (void)dk_setSelectedImagePicker:(DKImagePicker)picker {
    objc_setAssociatedObject(self, @selector(dk_selectedImagePicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);

     self.selectedImage = [picker(self.dk_manager.themeVersion) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self.pickers setValue:[picker copy] forKey:@"setSelectedImage:"];
    
}

@end
