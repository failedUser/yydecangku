//
//  ViewController.m
//  NetWorking
//
//  Created by apple on 16/6/21.
//  Copyright © 2016年 yueyin. All rights reserved.
//
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSURLConnection
//    NSURL  * url = [NSURL URLWithString:@"http://api.k780.com:88/?app=weather.today&weaid=1&&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    NSData * data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    NSURLSession
//    NSLog(@"--%ld--",data.length);
//    NSDictionary *mydata = [NSJSONSerialization  JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//    NSLog(@"%@",mydata);
//    NSDictionary * result = [mydata valueForKey:@"result"];
//    NSLog(@"%@",[result valueForKey:@"citynm"]);
////    NSString * city = dict["citynm"];
//    
    //NSURLSession
    //启动风火轮
//    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    //服务器给的域名
//    NSString * domainStr =@"http://api.k780.com:88/?app=weather.today&weaid=1&&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json";
    //创建一个可变数组并且添加元素
//    NSMutableDictionary *parametersDic = [NSMutableDictionary dictionary];
//    [parametersDic setObject:@"1" forKey:@"key"];
//    [parametersDic setObject:@"100" forKey:@"age"];
    //在3.0中AFHTTPSessionManager代替了AFHTTPRequestOperationManager
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //用GET的方式提交
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
//    [session GET:@"http://api.k780.com:88/?app=weather.today&weaid=1&&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
//        NSLog(@"JSON:%@",responseObject);
        [session GET:@"http://api.k780.com:88/?app=weather.today&weaid=1&&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"nihao a ");
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             NSLog(@"JSON:%@",responseObject);
            NSDictionary * result = [responseObject valueForKey:@"result"];
            NSLog(@"%@",[result valueForKey:@"citynm"]);
            NSString * city = responseObject[@"citynm"];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"失败");
        }];
//      
//        
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        NSLog(@"失败");
//    }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
