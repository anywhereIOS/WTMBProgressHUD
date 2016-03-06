//
//  UIViewController+HUD.m
//  项目框架封装
//
//  Created by 王涛 on 16/3/6.
//  Copyright © 2016年 304. All rights reserved.
//

#import "UIViewController+HUD.h"
#import "MBProgressHUD.h"
#import <objc/runtime.h>
static const void *HttpRequestHUDKey = &HttpRequestHUDKey;
@implementation UIViewController (HUD)
-(MBProgressHUD *)HUD
{
    return objc_getAssociatedObject(self, HttpRequestHUDKey);
}
-(void)setHUD:(MBProgressHUD *)HUD
{
    objc_setAssociatedObject(self, HttpRequestHUDKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
/**
 *  在自己给拱的view上显示提示信息:在调用hideHud方法实现隐藏,用于网络请求
 *
 *  @param view 自己提供的view
 *  @param hint 提示信息
 */
-(void)showHudInView:(UIView *)view hint:(NSString *)hint
{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    HUD.labelText = hint;
    HUD.userInteractionEnabled = YES;
    [view addSubview:HUD];
    [HUD show:YES];
    [self setHUD:HUD];
}
/**
 *  在窗口的view上显示提示信息,可以用于加载失败或者成功
 *
 *  @param hint 提示信息
 */
-(void)showHint:(NSString *)hint
{
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    
    //提示信息的显示模式
    hud.mode = MBProgressHUDModeText;
    
    hud.labelText = hint;
    hud.margin = 10.f;
    hud.yOffset = 200.f;
    
    //当hud隐藏的时候,从父类中移除hud,默认是NO
    hud.removeFromSuperViewOnHide = YES;
    
    [hud hide:YES afterDelay:2];
    
}
/**
 *  在窗口的view上显示提示信息,可以用于加载失败或者成功
 *
 *  @param hint    提示信息
 *  @param yoffset 提示框的偏移量
 */
-(void)showHint:(NSString *)hint yOffset:(float)yoffset
{
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = YES;
    hud.mode = MBProgressHUDModeText;
    hud.labelText = hint;
    hud.margin = 10.f;
    hud.yOffset = 200.f;
    hud.yOffset += yoffset;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2.0];
}
-(void)hideHud
{
    [[self HUD] hide:YES];
}
@end
