//
//  ViewController.m
//  VTextView
//
//  Created by Vic Zhou on 1/12/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

#import "ViewController.h"
#import "VTextView.h"

@interface ViewController () <
    VTextViewDelegate>

@property (nonatomic, strong) VTextView *vTextView;

@end

@implementation ViewController

#pragma mark - Getter

- (VTextView*)vTextView {
    if (!_vTextView) {
        _vTextView = [[VTextView alloc] initWithFrame:CGRectMake(0.f, 30.f, self.view.bounds.size.width, 200.f)];
        _vTextView.editable = NO;
        _vTextView.delegate = self;
        _vTextView.textImageMapping = [self getEmotionMap];
    }
    return _vTextView;
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.vTextView];
    self.vTextView.text = @"http://v.youku.com #iOS编程（第4版）#。@我是葛朗台小姐:ddffd@我是葛朗台小姐:美国Big Nerd Ranch的经典iOS开发教程，曾荣获Jolt生产力大奖。豆瓣链接 → http://t.cn/RZ5Q63F 亚马逊预售 → http://t.cn/RZXePhl [高兴][xkl转圈] http://v.youku.com @我是葛朗台小姐 [高兴][高兴][高兴][高兴][高兴][高兴][高兴][高兴]😜😜😚😚😚😝😗";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions Private

- (NSDictionary*)getEmotionMap {
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Emotion" ofType:@"plist"];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    return dictionary;
}

#pragma mark - VTextViewDelegate

- (void)vTextView:(VTextView *)textView didSelectUrl:(NSString *)url {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"URL"
                                                    message:url
                                                   delegate:nil
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
