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
#import <Photos/Photos.h>
#import "Macro.h"


#define IMAGE_CACHE_DIR [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
#define IMAGE_NAME @"avatar.png"


@interface MainViewController ()<UIWebViewDelegate,JsObjectDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, assign) NSInteger uploadID;
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

- (void)uploadImage:(NSInteger )uploadID {
    if (uploadID <= 0)
        return;
    
    
    NSString *url = @"http://www.xfx8888.com/zh_CN/Personal/Portrait";
    
    NSString *filePath = (NSString *)IMAGE_CACHE_DIR;
    filePath = [filePath stringByAppendingPathComponent:IMAGE_NAME];

    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileURL:[NSURL fileURLWithPath:filePath] name:@"file" fileName:IMAGE_NAME mimeType:@"image/png" error:nil];
    } error:nil];
    [request setValue:StrFromInteger(uploadID) forHTTPHeaderField:@"uid"];
    
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
                          
                          if ([[responseObject valueForKey:@"status"] integerValue] == 1) {
                              NSString *filename = [responseObject valueForKey:@"file"];
                              
                              [self refreshAvatar:filename];
                          }
                      }
                  }];
    
    [uploadTask resume];

}


- (BOOL)getImageFormPickView:(UIImage * _Nullable) result info:(NSDictionary * _Nullable )info {
    
    if (!result) {
        return NO;
    }
    
    NSString *filePath = (NSString *)IMAGE_CACHE_DIR;
    filePath = [filePath stringByAppendingPathComponent:IMAGE_NAME];
    
    @try
    {
        
        NSData *imageData = nil;
        NSString *ext = [filePath pathExtension];
        
        if ([ext isEqualToString:@"png"])
        {
            imageData = UIImagePNGRepresentation(result);
        }
        else
        {
            // the rest, we write to jpeg
            // 0. best, 1. lost. about compress.
            imageData = UIImageJPEGRepresentation(result,0);
        }
        
        if ((imageData == nil) || ([imageData length] <= 0))
            return NO;
        
        
        [imageData writeToFile:filePath atomically:YES];
        
        return YES;
    }
    
    @catch (NSException *e)
    {
        NSLog(@"create thumbnail exception.");
    }
    
    return NO;
}


- (void)executeJSFunction:(NSString *)func_parmas {
    
    JSContext *context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    NSString *funcJS = func_parmas;
    [context evaluateScript:funcJS];
}

- (void)refreshAvatar:(NSString *)avatarName {
    
    NSString *func = [NSString stringWithFormat:@"changeportrait('%@')",avatarName];
    
    [self executeJSFunction:func];
}




#pragma mark - JsObjectDelegate
- (void)selectPictureFromJS:(NSInteger)uploadID
{
    _uploadID = uploadID;
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
    
    __weak typeof(self) weakSelf = self;
    [[PHImageManager defaultManager] requestImageForAsset:asset targetSize:CGSizeMake(200, 200) contentMode:PHImageContentModeAspectFill options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        
        if ([weakSelf getImageFormPickView:result info:info])
            [self uploadImage:_uploadID];
        
        
        [picker dismissViewControllerAnimated:YES completion:nil];
        
    }];
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
