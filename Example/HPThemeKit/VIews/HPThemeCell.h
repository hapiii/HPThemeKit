//
//  HPThemeCell.h
//  HPThemeWork_Example
//
//  Created by hapii on 2019/1/17.
//  Copyright © 2019年 hapiii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPThemeModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HPThemeCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *themeImage;
@property (weak, nonatomic) IBOutlet UILabel *themeTitle;
@property(nonatomic,strong)HPThemeModel *theme;

@end

NS_ASSUME_NONNULL_END
