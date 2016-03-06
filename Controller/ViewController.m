//
//  ViewController.m
//  WTMBProgressHUD
//
//  Created by 王涛 on 16/3/6.
//  Copyright © 2016年 304. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD+WT.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [MBProgressHUD showCustomLoading:@"加载图片" name:@"page_loading_" imageNum:39];
    
    [MBProgressHUD show:@"加载图片" icon:nil view:self.view];
    
    [MBProgressHUD showHint:@"加载有偏移量" yOffset:50.f xOffset:50.f];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
