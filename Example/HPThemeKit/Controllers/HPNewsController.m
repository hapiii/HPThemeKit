//
//  HPNewsController.m
//  HPThemeWork_Example
//
//  Created by hapii on 2019/1/13.
//  Copyright © 2019年 hapiii. All rights reserved.
//

#import "HPNewsController.h"


@interface HPNewsController ()

@end

@implementation HPNewsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.dk_backgroundColorPicker = [[HPColorTable sharedColorTable] pickerWithKey:@"kTableViewCellUnreadBackgroundColorNormal"];
    // Do any additional setup after loading the view.
   // [self configTabBarItem];
    // Do any additional setup after loading the view.
    [self createAttLab];
}


-(void)createAttLab{
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 200)];
    lab.numberOfLines = 0;
    [self.view addSubview:lab];
    
    NSString *str = @"白日依山建，黄河入天流，遇上千里马，宏章拨钱薄";
    NSDictionary *dic = @{NSForegroundColorAttributeName : [UIColor redColor]};
    NSRange rangeVoucher = [str rangeOfString:@"黄河入天流"];
    NSMutableAttributedString *voucherAttiS = [[NSMutableAttributedString alloc] initWithString:str attributes:dic];
     [voucherAttiS addAttribute:NSForegroundColorAttributeName value:[UIColor purpleColor] range:rangeVoucher];
   
    lab.attributedText = voucherAttiS;
    
}

@end
