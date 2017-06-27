//
//  JsObject.m
//  OneStore
//
//  Created by yecongcong on 2017/6/27.
//  Copyright © 2017年 yecongcong. All rights reserved.
//

#import "JsObject.h"

@implementation JsObject

-(void)SelectPicture:(NSInteger)uploadID
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([self.delegate respondsToSelector:@selector(selectPictureFromJS:)]) {
            [self.delegate selectPictureFromJS:uploadID];
        }
    });
    NSLog(@"this is ios SelectPicture %ld",(long)uploadID);
}

@end
