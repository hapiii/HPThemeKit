//
//  HPThemeCell.m
//  HPThemeWork_Example
//
//  Created by hapii on 2019/1/17.
//  Copyright © 2019年 hapiii. All rights reserved.
//

#import "HPThemeCell.h"
#import "UIImageView+WebCache.h"

@implementation HPThemeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    //self.contentView.backgroundColor = [UIColor whiteColor];
   // self.contentView.dk_backgroundColorPicker = HPColorPickerWithKey(kTableViewCellHeadCellBackgroundColorHighlighted);
    // Initialization code
}

-(void)setTheme:(HPThemeModel *)theme{
    _theme = theme;
    [self.themeImage sd_setImageWithURL:theme.themeImgUrl];
    self.themeTitle.text= theme.themeName;
}

@end
