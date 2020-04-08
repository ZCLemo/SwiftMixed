//
//  ViewController.m
//  SwiftMixed
//
//  Created by 赵琛 on 2020/4/8.
//  Copyright © 2020 赵琛. All rights reserved.
//

/*
OC和swift混编注意点：
1.新建一个swift文件时，会提示你是否建立桥接文件，系统会建立“工程名-Bridging-Header.h”
2.配置工程Build Settings 设置Defines Mod￼ule 为Yes,设置Product Module Name 为当前工程名
3.swift引用OC文件，需要在“工程名-Bridging-Header.h”桥接文件中导入OC头文件
4.OC引用swift文件，在OC文件中导入#import "工程名-Swift.h"，注意swift文件的方法名前面要加@objc，不然方法调用不了
*/


#import "ViewController.h"
#import "SwiftMixed-Swift.h"
#import "UIView+TebonFrame.h"

@interface ViewController ()

@property (nonatomic,strong)MessageTipView *tipView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(50, 50, 100, 100);
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    self.tipView = [[MessageTipView alloc] init];
    [self.view addSubview:self.tipView];
    
}

- (void)btnClick
{
    [self.tipView showWithMessage:@"远一点哈的过大搭嘎晃过上帝的个体的恰噶是单个打的远一点哈的过大搭嘎晃过上帝的个体的恰噶是单个打的远一点哈的过大搭嘎晃过上帝的个体的恰噶是单个打的远一点哈的过大搭嘎晃过上帝的个体的恰噶是单个打的远一点哈的过大搭嘎晃过上帝的个体的恰噶是单个打的" superViewHeight:self.view.tebon_h];
}

@end
