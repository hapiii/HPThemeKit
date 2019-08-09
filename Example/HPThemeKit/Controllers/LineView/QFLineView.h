//
//  QFLineView.h
//  QFEducation
//
//  Created by hapii on 2019/8/8.
//  Copyright © 2019 hapii. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QFLineModel;

NS_ASSUME_NONNULL_BEGIN

@interface QFLineView : UIScrollView

@property (nonatomic, copy) NSArray <QFLineModel *> *dataArr;

@end

NS_ASSUME_NONNULL_END
