//
//  TestViewController.m
//  Swift懒加载和OC的区别
//
//  Created by 邵泽俊 on 2017/1/11.
//  Copyright © 2017年 邵泽俊. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@property(nonatomic,strong)UILabel * lable;

@end

@implementation TestViewController

-(UILabel *)lable{
    if (!_lable) {
        
        _lable.text = @"jason";
        [_lable sizeToFit];
        _lable = [[UILabel alloc] init];
        _lable.center = self.view.center;
        
    }
    return _lable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.lable];
    
    _lable = nil;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
