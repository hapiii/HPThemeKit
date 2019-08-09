//
//  HPNewsController.m
//  HPThemeWork_Example
//
//  Created by hapii on 2019/1/13.
//  Copyright © 2019年 hapiii. All rights reserved.
//

#import "HPNewsController.h"
#import <HPThemeKit/UILabel+HPNight.h>
#import "HPLineController.h"
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
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 200)];
    [btn setTitle:@"Line" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(goToLineView) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    /*
    NSString *str = @"白日依山建，黄河入天流，遇上千里马，宏章拨钱薄";
    NSDictionary *dic = @{NSForegroundColorAttributeName : [UIColor redColor]};
    NSRange rangeVoucher = [str rangeOfString:@"黄河入天流"];
    NSMutableAttributedString *voucherAttiS = [[NSMutableAttributedString alloc] initWithString:str attributes:dic];
     [voucherAttiS addAttribute:NSForegroundColorAttributeName value:[UIColor purpleColor] range:rangeVoucher];
   
    lab.attributedText = voucherAttiS;
    lab.dk_attributedTextPicker = [[HPColorTable sharedColorTable] AttributePickerWithKey:@"kNavigationBarTitleColor"];
    */
    
    NSString *str = @"白日依山建，黄河入天流，遇上千里马，宏章拨钱薄";
    NSDictionary *dic = @{NSForegroundColorAttributeName : [UIColor redColor]};
   
    NSMutableAttributedString *voucherAttiS = [[NSMutableAttributedString alloc] initWithString:str attributes:dic];
    
//    [lab hp_addAttribute:voucherAttiS Range:[str rangeOfString:@"黄河入天流"] Key:@"kTabWithInPageTitleColorNormal"];
//    void (^addAtr)(UILabel *lab,NSMutableAttributedString *attStr) = ^(UILabel *lab,NSMutableAttributedString *voucherAttiS){
//
//         NSRange rangeVoucher = [str rangeOfString:@"黄河入天流"];
//         [voucherAttiS addAttribute:NSForegroundColorAttributeName value:[UIColor purpleColor] range:rangeVoucher];
//        lab.attributedText = voucherAttiS;
//        lab.dk_attributedTextPicker = [[HPColorTable sharedColorTable] AttributePickerWithKey:@"kNavigationBarTitleColor"];
//
//    };
    
//    addAtr(lab,voucherAttiS);
    
}

- (void)goToLineView{
    HPLineController *vc = [[HPLineController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
