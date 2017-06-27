//
//  MainViewController.m
//  OneStore
//
//  Created by yecongcong on 2017/6/27.
//  Copyright © 2017年 yecongcong. All rights reserved.
//

#import "MainViewController.h"
#import "JsObject.h"

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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
