//
//  HPColorTable.m
//  HPThemeWork_Example
//
//  Created by hapii on 2019/1/25.
//  Copyright © 2019年 hapiii. All rights reserved.
//

#import "HPColorTable.h"
#import "HPThemeBundleHelper.h"

@interface NSArray (HPColorRead)

///安全取色值
- (id)ColorAtIndex:(NSUInteger)index;

@end

@implementation NSArray (HPColorRead)

-(id)ColorAtIndex:(NSUInteger)index{
    
    if (index<3) {
         return index < self.count ? self[index] : @"0x00";
    }else{
        return index < self.count ? self[index]:@"1";
    }
    
}

@end

@interface HPColorTable ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, UIColor *> *table;

@end

@implementation HPColorTable

+ (instancetype)sharedColorTable {
    
    static HPColorTable *sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        
        sharedInstance = [[HPColorTable alloc] init];
        
        NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
        NSString *currectThemeName = [user stringForKey:THEME];
        /*默认主题，颜色从本地plist表取 颜色*/
        if (IS_Empty_String(currectThemeName)) {
             NSString *ThemeConfigPath = [[HPThemeBundleHelper frameworkBundle] pathForResource:@"ThemeConfig" ofType:@"plist"];
            sharedInstance.file = ThemeConfigPath;
            sharedInstance.imagesFilePath = @"";
        }else{
            sharedInstance.file = [[ThemeFolderPath stringByAppendingString:currectThemeName] stringByAppendingString:@"/ThemeConfig.plist"];
            sharedInstance.imagesFilePath = [ThemeFolderPath stringByAppendingString:currectThemeName];
        }
        
    });
    return sharedInstance;
    
}

- (void)reloadColorTable {
    self.table = nil;
  
    NSString *filepath = [[NSBundle mainBundle] pathForResource:self.file.stringByDeletingPathExtension ofType:self.file.pathExtension];
     NSMutableDictionary *ThemeConfig ;
    if (IS_Empty_String(filepath)) {
        ThemeConfig = [[NSMutableDictionary alloc] initWithContentsOfFile:self.file];
    }else{
        ThemeConfig= [[NSMutableDictionary alloc] initWithContentsOfFile:filepath];
    }
   
   
    
    NSLog(@"DKColorTable:\n%@", ThemeConfig);
    NSDictionary *ColorTable = ThemeConfig[@"ColorTable"];
    [ColorTable enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString*colorStr=ColorTable[key];
        if (IS_Empty_String(colorStr)) {
            [self.table setObject:[UIColor whiteColor] forKey:key];
        }else{
            NSArray*colorArray=[colorStr componentsSeparatedByString:@","];
            UIColor *color = [UIColor colorWithRed:strtoul([[colorArray ColorAtIndex:0] UTF8String], 0, 0)/255.0 green:strtoul([[colorArray ColorAtIndex:1] UTF8String], 0, 0)/255.0 blue:strtoul([[colorArray ColorAtIndex:2] UTF8String], 0, 0)/255.0 alpha:strtoul([[colorArray ColorAtIndex:3] UTF8String], 0, 0)];
            
            [self.table setObject:color forKey:key];
            
        }
       
    }];
    
}


- (DKColorPicker)pickerWithKey:(NSString *)key {
    NSParameterAssert(key);
    DKColorPicker picker = ^(DKThemeVersion *themeVersion) {
        return [self.table valueForKey:key];
    };
    return picker;
}

#pragma mark - Getter/Setter

- (NSMutableDictionary *)table {
    if (!_table) {
        _table = [[NSMutableDictionary alloc] init];
    }
    return _table;
}

- (void)setFile:(NSString *)file {
    _file = file;
    [self reloadColorTable];
}



@end
