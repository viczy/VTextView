//
//  ViewController.m
//  VTextView
//
//  Created by Vic Zhou on 1/12/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

#import "ViewController.h"
#import "VTextView.h"

@interface ViewController ()

@property (nonatomic, strong) VTextView *vTextView;

@end

@implementation ViewController

#pragma mark - Getter

- (VTextView*)vTextView {
    if (!_vTextView) {
        _vTextView = [[VTextView alloc] initWithFrame:CGRectMake(0.f, 30.f, self.view.bounds.size.width, 200.f)];
        _vTextView.editable = YES;
        _vTextView.textImageMapping = [self getEmotionMap];
    }
    return _vTextView;
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.vTextView];
    self.vTextView.text = @"测试[高兴][生气],http://12345.com @住在这里: 当时#大幅度发# ";
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

@end
