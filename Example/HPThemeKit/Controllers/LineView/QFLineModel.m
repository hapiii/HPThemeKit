//
//  QFLineModel.m
//  QFEducation
//
//  Created by hapii on 2019/8/8.
//  Copyright © 2019 hapii. All rights reserved.
//

#import "QFLineModel.h"

@implementation QFLineModel 

+ (QFLineModel *) modelWithDate:(NSString *)date Height:(NSString *)height{
    QFLineModel *model = [[QFLineModel alloc] init];
    model.pointTime = date;
    model.pointHeight = height;
    return model;
}
@end
