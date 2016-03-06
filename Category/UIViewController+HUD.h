//
//  UIViewController+HUD.h
//  项目框架封装
//
//  Created by 王涛 on 16/3/6.
//  Copyright © 2016年 304. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HUD)
-(void)showHudInView:(UIView *)view hint:(NSString *)hint;
-(void)hideHud;
-(void)showHint:(NSString *)hint;
-(void)showHint:(NSString *)hint yOffset:(float)yoffset;
@end
