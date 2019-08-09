//
//  QFLineRowView.m
//  QFEducation
//
//  Created by hapii on 2019/8/9.
//  Copyright © 2019 hapii. All rights reserved.
//

#import "QFLineRowView.h"

@implementation QFLineRowView{
    CGPoint _headPoint;
    CGPoint _endPoint;
}

- (instancetype)initWithFrame:(CGRect)frame headPoint:(CGPoint )headPoint endPoint:(CGPoint)endPoint{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        _headPoint = headPoint;
        _endPoint = endPoint;
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    
    UIColor *color = [UIColor colorWithRed:233/255.0f green:78/255.0f blue:92/255.0f alpha:1];
    [color set];
    UIBezierPath *path = [UIBezierPath bezierPath];
   
    path.lineWidth = 3.0;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinBevel;
    [path moveToPoint:CGPointMake(0, _headPoint.y)];
    [path addLineToPoint:CGPointMake(self.frame.size.width, _endPoint.y)];
    [path stroke];
}


@end
