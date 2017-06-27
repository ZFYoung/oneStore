//
//  MainViewController.m
//  OneStore
//
//  Created by yecongcong on 2017/6/27.
//  Copyright © 2017年 yecongcong. All rights reserved.
//

#import "MainViewController.h"
#import "JsObject.h"
#import <Photos/Photos.h>

@interface MainViewController ()<UIWebViewDelegate,JsObjectDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
    NSURL *url = [NSURL URLWithString:@"http://www.xfx8888.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    JSContext *context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    JsObject *testJO=[JsObject new];
    testJO.delegate = self;
    context[@"jsObject"]=testJO;
}

#pragma mark - JsObjectDelegate
- (void)selectPictureFromJS:(NSInteger)uploadID
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self openCamera];
    }];
    UIAlertAction *cameraRoll = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self openCameraRoll];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:camera];
    [alert addAction:cameraRoll];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)openCamera
{
    UIImagePickerController * imagePickerVC = [[UIImagePickerController alloc] init];
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = NO;
    imagePickerVC.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
    imagePickerVC.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    imagePickerVC.cameraFlashMode = UIImagePickerControllerCameraFlashModeAuto;
    imagePickerVC.showsCameraControls = NO;
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

- (void)openCameraRoll
{
    UIImagePickerController * imagePickerVC = [[UIImagePickerController alloc] init];
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = NO;
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    NSString *url = [info objectForKey:@"UIImagePickerControllerReferenceURL"];
    PHAsset *asset = [PHAsset fetchAssetsWithALAssetURLs:@[url] options:nil].firstObject;
    PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
    options.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
    options.networkAccessAllowed = YES;
    options.resizeMode = PHImageRequestOptionsResizeModeExact;
    options.progressHandler = ^(double progress, NSError *error, BOOL *stop, NSDictionary *info) {
        NSLog(@"%f", progress);
    };
    
    [[PHImageManager defaultManager] requestImageForAsset:asset targetSize:CGSizeMake(200, 200) contentMode:PHImageContentModeAspectFill options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        
    }];
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
