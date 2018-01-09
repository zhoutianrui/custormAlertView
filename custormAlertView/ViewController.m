//
//  ViewController.m
//  custormAlertView
//
//  Created by  ztryxh on 2018/1/9.
//  Copyright © 2018年 ebo. All rights reserved.
//

#import "ViewController.h"
#import "customAlertView.h"
@interface ViewController ()
{
     customAlertView *myAlertView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor cyanColor]];
    myAlertView=[[customAlertView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    __weak customAlertView *weakAlertView=myAlertView;
    
    
    myAlertView.sureBlock = ^(UIButton *sender) {
        [weakAlertView dismiss];
        
    };
    myAlertView.cancelBlock = ^(UIButton *sender) {
        [weakAlertView dismiss];
    };
    UIButton *demoBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [demoBtn setFrame:CGRectMake(100, 200, 100, 100)];
    [demoBtn setBackgroundColor:[UIColor redColor]];
    [demoBtn setTitle:@"click" forState:UIControlStateNormal];
    [demoBtn addTarget:self action:@selector(demoBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:demoBtn];
}
-(void)demoBtnClick
{
    [myAlertView show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
