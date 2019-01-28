//
//  HttpDownLoad.h
//  HPThemeWork
//
//  Created by hapii on 2019/1/12.
//

#import <Foundation/Foundation.h>
@class HttpDownLoad;
@protocol HttpDownLoadDelegate <NSObject>

-(void)httpDownLoadFinishOrFail:(BOOL)isSuccess target:(HttpDownLoad*)http;

@end
NS_ASSUME_NONNULL_BEGIN

@interface HttpDownLoad : NSObject

@property(nonatomic,strong)NSURLSession*mySession;
///缓存的名称
@property(nonatomic,copy)NSString*cacheFileName;

//请求方式
@property(nonatomic)BOOL isPost;


//解析数据类型
@property(nonatomic,strong)NSData*data;
@property(nonatomic,strong)UIImage*dataImage;
@property(nonatomic,strong)NSArray*dataArray;
@property(nonatomic,strong)NSDictionary*dataDic;

//代理的接受对象
@property(nonatomic,assign)id<HttpDownLoadDelegate>delegate;

//block的接受对象 myBlock相当于函数名称
@property(nonatomic,copy)void(^myBlock)(HttpDownLoad*,BOOL);


//第一个参数是地址 第二个参数是对应的键值对,也就是这个地址相应的参数
-(instancetype)initWithURLStr:(NSString*)str DataDic:(NSDictionary*)dic;


-(instancetype)initWithURLStr:(NSString *)str Post:(BOOL)isPost DataDic:(NSDictionary *)dic Delegate:(id <HttpDownLoadDelegate>)target;



-(instancetype)initWithURLStr:(NSString *)str Post:(BOOL)isPost DataDic:(NSDictionary *)dic Block:(void(^)(HttpDownLoad*,BOOL))a;




+(NSString *) md5: (NSString *) inPutText;


@end






NS_ASSUME_NONNULL_END
