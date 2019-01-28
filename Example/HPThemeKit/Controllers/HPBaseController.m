//
//  HPBaseController.m
//  HPThemeWork_Example
//
//  Created by hapii on 2019/1/13.
//  Copyright © 2019年 hapiii. All rights reserved.
//

#import "HPBaseController.h"

@interface HPBaseController ()

@end

@implementation HPBaseController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view addSubview:self.iv];
   
    // Do any additional setup after loading the view.
}

-(UIImageView *)iv{
    if (_iv==nil) {
        _iv = [[UIImageView alloc] initWithFrame:CGRectMake(100, 300, 200, 200)];
        
    }
    return _iv;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
