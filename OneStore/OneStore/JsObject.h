//
//  JsObject.h
//  OneStore
//
//  Created by yecongcong on 2017/6/27.
//  Copyright © 2017年 yecongcong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import <UIKit/UIKit.h>

@protocol JsObjectProtocol <JSExport>
-(void)SelectPicture:(NSInteger)uploadID;
//-(void)SelectPicture:(NSString *)uploadID;
@end

@protocol JsObjectDelegate <NSObject>
- (void)selectPictureFromJS:(NSInteger)uploadID;
@end

@interface JsObject : NSObject<JsObjectProtocol>
@property (nonatomic, assign) id<JsObjectDelegate> delegate;

@end
