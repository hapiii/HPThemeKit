//
//  HttpDownLoad.m
//  HPThemeWork
//
//  Created by hapii on 2019/1/12.
//

#import "HttpDownLoad.h"
#import "NSFileManager+HPAdd.h"
#import <CommonCrypto/CommonDigest.h>

@implementation HttpDownLoad

-(instancetype)initWithURLStr:(NSString *)str Post:(BOOL)isPost DataDic:(NSDictionary *)dic Block:(void (^)(HttpDownLoad *, BOOL))a
{
    _myBlock=a;
    //请求方式
    _isPost=isPost;
    if (self=[self initWithURLStr:str DataDic:dic]) {
        
    }
    return self;
    
}
-(instancetype)initWithURLStr:(NSString *)str Post:(BOOL)isPost DataDic:(NSDictionary *)dic Delegate:(id<HttpDownLoadDelegate>)target
{
    _delegate=target;
    //请求方式
    _isPost=isPost;
    
    if (self=[self initWithURLStr:str DataDic:dic]) {
        
    }
    return self;
}


-(instancetype)initWithURLStr:(NSString*)str DataDic:(NSDictionary*)dic{
    if (self=[super init]) {
        if (str==nil) {
            return self;
        }
        _mySession=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        
        str=[str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        
        NSString*dataDicStr=nil;
        if (dic) {
            dataDicStr=[[NSString alloc]initWithData:[NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding];
            dataDicStr =[NSString stringWithFormat:@"%@%@",str,dataDicStr];
        }else{
            dataDicStr=str;
        }
        
        
        
        
        //加密出地址  不止用于校验文件使用,当下载完成后写入文件,也需要使用这个地址
        _cacheFileName=[HttpDownLoad md5:dataDicStr];
        
        //判断文件缓存是否有效
        NSFileManager*manager=[NSFileManager defaultManager];
        if ([manager fileWithPath:_cacheFileName TimeOut:60*60]) {
           
            NSString*path=[NSString stringWithFormat:@"%@/Documents/%@",NSHomeDirectory(),_cacheFileName];
            
            NSData*cacheData=[NSData dataWithContentsOfFile:path];
            
            
            [self jsonValue:cacheData];
            
            if ([_delegate respondsToSelector:@selector(httpDownLoadFinishOrFail:target:)]) {
                [_delegate httpDownLoadFinishOrFail:YES target:self];
            }
            
            if (_myBlock) {
                self.myBlock(self,YES);
            }
            
        }else{
           
            [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
           
            NSMutableURLRequest*request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:str]cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
            
           
            if (_isPost) {
                [request setHTTPMethod:@"POST"];
                
                [request setHTTPBody:[dataDicStr dataUsingEncoding:NSUTF8StringEncoding]];
            }else{
                
                if (dic) {
                
                    NSArray*allKeys=[dic allKeys];
                    NSMutableString*tempStr=[NSMutableString stringWithString:@"?"];
                    for (NSString*key in allKeys) {
                        NSString*value=dic[key];
                        [tempStr appendFormat:@"%@=%@&",key,value];
                    }
                    NSString*newStr=[tempStr substringToIndex:tempStr.length-1];
                    
                    str=[NSString stringWithFormat:@"%@%@",str,newStr];
                    
                    
                    
                }
                
                //对request进行重新指向
                request=[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
                
            }
            
             __weak typeof(self) weakSelf = self;
            NSURLSessionDataTask*task=[_mySession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
                    
                    if (error) {
                        if ([weakSelf.delegate respondsToSelector:@selector(httpDownLoadFinishOrFail:target:)]) {
                            [weakSelf.delegate httpDownLoadFinishOrFail:NO target:self];
                        }
                        //进行block回调
                        if (weakSelf.myBlock) {
                            weakSelf.myBlock(self,NO);
                        }
                        
                        
                    }else{
                        //进行数据解析
                        [weakSelf jsonValue:data];
                        
                        //缓存
                        NSString*path=[NSString stringWithFormat:@"%@/Documents/%@",NSHomeDirectory(),weakSelf.cacheFileName];
                        
                        [data writeToFile:path atomically:YES];
                        
                        if ([weakSelf.delegate respondsToSelector:@selector(httpDownLoadFinishOrFail:target:)]) {
                            [weakSelf.delegate httpDownLoadFinishOrFail:YES target:self];
                        }
                        
                        if (weakSelf.myBlock) {
                            weakSelf.myBlock(self,YES);
                        }
                        
                    }
                    
                });
                
            }];
            [task resume];
        }
        
        
        
        
    }
    return self;
}

-(void)jsonValue:(NSData*)data{
    self.data=data;
    
    id result =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    if ([result isKindOfClass:[NSDictionary class]]) {
        self.dataDic=[NSDictionary dictionaryWithDictionary:result];
    }else{
        if ([result isKindOfClass:[NSArray class]]) {
            self.dataArray=[NSArray arrayWithArray:result];
        }else{
            
            self.dataImage=[UIImage imageWithData:data];
            
        }
        
    }
}




+(NSString *) md5: (NSString *) inPutText
{
    const char *cStr = [inPutText UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}



@end
