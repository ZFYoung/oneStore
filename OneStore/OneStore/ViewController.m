//
//  ViewController.m
//  OneStore
//
//  Created by yecongcong on 2017/6/25.
//  Copyright © 2017年 yecongcong. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()<WKUIDelegate>
@property (nonatomic, strong) WKWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.xfx8888.com"]]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (WKWebView *)webView
{
    if (_webView == nil) {
        _webView = [[WKWebView alloc] init];
        _webView.UIDelegate = self;
        _webView.frame = CGRectMake(0, 20, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-20);
        [self.view addSubview:_webView];
    }
    return _webView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
