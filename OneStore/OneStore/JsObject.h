//
//  JsObject.h
//  OneStore
//
//  Created by yecongcong on 2017/6/27.
//  Copyright © 2017年 yecongcong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>  

//首先创建一个实现了JSExport协议的协议
@protocol JsObjectProtocol <JSExport>

//此处我们测试几种参数的情况
-(void)SelectPicture:(NSInteger)uploadID;
//-(void)SelectPicture:(NSString *)uploadID;

@end

@interface JsObject : NSObject<JsObjectProtocol>

@end
