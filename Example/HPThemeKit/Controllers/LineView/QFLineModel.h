//
//  QFLineModel.h
//  QFEducation
//
//  Created by hapii on 2019/8/8.
//  Copyright © 2019 hapii. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QFLineModel : NSObject

@property (nonatomic, copy) NSString *pointTime;

@property (nonatomic, copy) NSString *pointHeight;

+(QFLineModel *) modelWithDate:(NSString *)date Height:(NSString *)height;

@end

NS_ASSUME_NONNULL_END
