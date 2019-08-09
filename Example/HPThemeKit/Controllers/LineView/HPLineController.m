//
//  HPLineController.m
//  HPThemeKit_Example
//
//  Created by hapii on 2019/8/9.
//  Copyright © 2019 hapiii. All rights reserved.
//

#import "HPLineController.h"
#import "QFLineView.h"
#import "QFLineModel.h"

@interface HPLineController ()

@property (nonatomic, copy) NSArray <QFLineModel *> *dataArr;
@property (nonatomic, strong) QFLineView *lineView;
@end

@implementation HPLineController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    [self loadData];
    
    [self setupUI];
    
    // Do any additional setup after loading the view.
}

- (void)loadData{
    
    QFLineModel *model0 = [QFLineModel modelWithDate:@"8.1" Height:@"4.5"];
    QFLineModel *model1 = [QFLineModel modelWithDate:@"8.2" Height:@"8.8"];
    QFLineModel *model2 = [QFLineModel modelWithDate:@"8.3" Height:@"1.4"];
    QFLineModel *model3 = [QFLineModel modelWithDate:@"8.4" Height:@"4.6"];
    QFLineModel *model4 = [QFLineModel modelWithDate:@"8.5" Height:@"6.2"];
    QFLineModel *model5 = [QFLineModel modelWithDate:@"8.6" Height:@"0.8"];
    QFLineModel *model6 = [QFLineModel modelWithDate:@"8.7" Height:@"9.2"];
    QFLineModel *model7 = [QFLineModel modelWithDate:@"8.7" Height:@"9.2"];
    QFLineModel *model8 = [QFLineModel modelWithDate:@"8.7" Height:@"9.2"];
    
    _dataArr = @[model0,model1,model2,model3,model4,model5,model6,model7,model8];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.lineView.dataArr = self->_dataArr;
    });
    
}

- (void)setupUI{
    self->_lineView = [[QFLineView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 300)];
    [self.view addSubview:self->_lineView];
    
}

@end
