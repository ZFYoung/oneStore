//
//  MainViewController.m
//  OneStore
//
//  Created by yecongcong on 2017/6/27.
//  Copyright © 2017年 yecongcong. All rights reserved.
//

#import "MainViewController.h"
#import "JsObject.h"
#import "AFNetworking.h"

@interface MainViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
    NSURL *url = [NSURL URLWithString:@"http://www.xfx8888.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    // Do any additional setup after loading the view.
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(uploadImage:) name:@"SELECT_PICTURE_NOTIFICATION" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    JSContext *context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    JsObject *testJO=[JsObject new];
    context[@"jsObject"]=testJO;
}

- (void)uploadImage:(NSNotification *)uploadNoti {
    
    NSString *url = @"http://www.xfx8888.com/zh_CN/Personal/Portrait";
    
    NSString *furl = [NSString stringWithFormat:@"%@/%@/%@",NSHomeDirectory(),@"Documents",@"He.jpg"];
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileURL:[NSURL fileURLWithPath:furl] name:@"file" fileName:@"filename.jpg" mimeType:@"image/jpeg" error:nil];
    } error:nil];
    [request setValue:[NSString stringWithFormat:@"%@",[uploadNoti object]] forHTTPHeaderField:@"uid"];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionUploadTask *uploadTask;
    uploadTask = [manager
                  uploadTaskWithStreamedRequest:request
                  progress:^(NSProgress * _Nonnull uploadProgress) {
                      // This is not called back on the main queue.
                      // You are responsible for dispatching to the main queue for UI updates
                      dispatch_async(dispatch_get_main_queue(), ^{
                          //Update the progress view
//                          [progressView setProgress:uploadProgress.fractionCompleted];
                      });
                  }
                  completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                      if (error) {
                          NSLog(@"Error: %@", error);
                      } else {
                          NSLog(@"%@ %@", response, responseObject);
                      }
                  }];
    
    [uploadTask resume];

    

}

@end
