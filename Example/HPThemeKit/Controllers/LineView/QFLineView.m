//
//  QFLineView.m
//  QFEducation
//
//  Created by hapii on 2019/8/8.
//  Copyright © 2019 hapii. All rights reserved.
//

#import "QFLineView.h"
#import "QFLineModel.h"
#import <YYKit/UIView+YYAdd.h>
#import "QFLineRowView.h"

@interface QFLineView ()

@property (nonatomic, strong) UILabel *tipLabel;//当天学习时常

@end

@implementation QFLineView{
    CGFloat _rowWidth;//Row 宽度
    CGFloat _maxHeight;//Y轴最大高度
    CGFloat _lineHeight;//线的高度
    
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
          _rowWidth = frame.size.width/7.0f;
        _lineHeight = frame.size.height -35;
         [self configUI];

    }
    return self;
}

- (void)configUI{
    
    self.showsHorizontalScrollIndicator = NO;
   
    [self setBackgroundColor:[UIColor whiteColor]];
    
    [self addSubview:self.tipLabel];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (_dataArr.count==0) {
        return;
    }
    //获取点击点的坐标
    CGPoint touchPoint = [[touches  anyObject] locationInView:self];
    CGFloat offset = touchPoint.x - _rowWidth/2;
    
    //第几个
    NSInteger row = offset/_rowWidth ;
    //余数
    float remainder =fmodf(offset, _rowWidth);
    
    if (remainder>=_rowWidth/2) {
        row++;
    }
   
    CGPoint point = CGPointMake(_rowWidth/2+_rowWidth*row, _lineHeight*(1-[_dataArr[row].pointHeight floatValue]/_maxHeight));
    self.tipLabel.text = [NSString stringWithFormat:@"学习了%@小时",_dataArr[row].pointHeight];
    self.tipLabel.textAlignment = NSTextAlignmentCenter;
    [self.tipLabel sizeToFit];
    self.tipLabel.center = CGPointMake(point.x, point.y - 10);
    
}

- (void)setDataArr:(NSArray<QFLineModel *> *)dataArr{
    
    _dataArr = dataArr;
    _maxHeight = [self getTheMaxPointHeight:_dataArr];
    
    for (UIView *view in self.subviews) {
        if (view != self.tipLabel) {
            [view removeFromSuperview];
        }
    }
    
    for (CAShapeLayer *layer in self.layer.sublayers) {
        [layer removeFromSuperlayer];
    }
    
    self.contentSize = CGSizeMake(dataArr.count*_rowWidth, self.frame.size.height);
   
    for (int i = 0; i<dataArr.count; i++) {
        
        [self configLineUIWithIndex:i];
    }
    
    [self addSubview:self.tipLabel];
    [self bringSubviewToFront:self.tipLabel];
   
}

///获取Y轴最高点
- (CGFloat )getTheMaxPointHeight:(NSArray<QFLineModel *> *)dataArr{
    __block float maxValue = 0;
    [dataArr enumerateObjectsUsingBlock:^(QFLineModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.pointHeight floatValue] >= maxValue) {
            maxValue = [obj.pointHeight floatValue];
        }
    }];
    //多加4个小时
    return maxValue + 4;
}

///ROW UI
- (void)configLineUIWithIndex:(NSInteger)i{
    
     QFLineModel *model = _dataArr[i];
   
    CGPoint point = CGPointMake(_rowWidth/2+_rowWidth*i, _lineHeight*(1-[_dataArr[i].pointHeight floatValue]/_maxHeight));
    
    //线
    CAShapeLayer *line = [CAShapeLayer layer];
    line.frame = CGRectMake(point.x, 10, 0.55,_lineHeight);
    line.backgroundColor = [UIColor lightGrayColor].CGColor;
    
    if (i<_dataArr.count-1) {//折线Line
        
        CGPoint endPoint = CGPointMake(_rowWidth/2+_rowWidth*i, _lineHeight*(1-[_dataArr[i+1].pointHeight floatValue]/_maxHeight));
        
        QFLineRowView *view = [[QFLineRowView alloc] initWithFrame:CGRectMake(point.x, 0,_rowWidth , line.frame.size.height) headPoint:point endPoint:endPoint];
        [self addSubview:view];
        
    }
   
    //X轴文字
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 15)];
    label.text = model.pointTime;
    label.textAlignment = NSTextAlignmentCenter;
    [label sizeToFit];
    label.center = CGPointMake(point.x, self.frame.size.height-15);
    //点
    UIView *pointView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
    pointView.center = point;
    pointView.backgroundColor = [UIColor redColor];
    
    [self addSubview:label];
    [self.layer addSublayer:line];
    [self addSubview:pointView];
    
}

- (UILabel *)tipLabel{
    
    if (_tipLabel == nil) {
        _tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
        _tipLabel.textColor = [UIColor colorWithRed:233/255.0f green:78/255.0f blue:92/255.0f alpha:1];
        _tipLabel.font = [UIFont systemFontOfSize:12.0f];
        _tipLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _tipLabel;
}
@end
