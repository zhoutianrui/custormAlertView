//
//  customAlertView.m
//  EBOexchange
//
//  Created by  ztryxh on 2018/1/9.
//  Copyright © 2018年 ebo. All rights reserved.
//

#import "customAlertView.h"
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kSCALE_WIDTH(w)     (kScreenWidth/375.0*w)
#define kSCALE_HEIGHT(h)    (kScreenHeight/667.0*h)
#define kLogBackGroundColor kGetColor(18,21,28)
#define kGetColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
@implementation customAlertView
{
    UIButton *sureBtn;
    UIButton *cancelBtn;
    UITextField *accountTextField;
    UITextField *pwdTextField;
}
-(id)initWithFrame:(CGRect)frame{
    
    self=[super initWithFrame:frame];
    if(self){
        
        self.windowLevel=UIWindowLevelAlert;
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(60, 160, kSCALE_WIDTH(270),kSCALE_HEIGHT(188.5))];
        view.backgroundColor = kLogBackGroundColor;
        view.center = CGPointMake(kScreenWidth/2, kScreenHeight/2-30);
        [view.layer setBorderColor:kGetColor(42, 56, 78).CGColor];
        [view.layer setBorderWidth:1];
        [view.layer setCornerRadius:7.0f];
        [view.layer setMasksToBounds:YES];
    

        UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(kSCALE_WIDTH(30), kSCALE_HEIGHT(10), view.frame.size.width-2*kSCALE_WIDTH(30), 20)];
        [titleLabel setText:@"账号"];
        [titleLabel setTextColor:[UIColor whiteColor]];
        [titleLabel setFont:[UIFont systemFontOfSize:13.5]];
        [titleLabel setTextAlignment:NSTextAlignmentLeft];
        [view addSubview:titleLabel];
        
        UIView  *accountView=[[UIView alloc]initWithFrame:CGRectMake(kSCALE_WIDTH(20), CGRectGetMaxY(titleLabel.frame)+5, view.frame.size.width-2*kSCALE_WIDTH(20), kSCALE_HEIGHT(30))];
        [accountView.layer setBorderColor:kGetColor(42, 56, 78).CGColor];
        [accountView.layer setBorderWidth:1];
        [view addSubview:accountView];
        
        accountTextField=[[UITextField alloc]initWithFrame:CGRectMake(10, 0, accountView.frame.size.width-20, accountView.frame.size.height)];
        [accountView addSubview:accountTextField];
        [accountTextField setFont:[UIFont systemFontOfSize:13.5]];
        [accountTextField setTextColor:kGetColor(92, 102, 114)];
        [accountTextField setBackgroundColor:[UIColor clearColor]];
        [accountTextField setAttributedPlaceholder:[self setMyPlaceHolder:@"请输入账号"]];
        
        

        
        UILabel *pwdLabel=[[UILabel alloc]initWithFrame:CGRectMake(kSCALE_WIDTH(30), CGRectGetMaxY(accountView.frame)+kSCALE_HEIGHT(10), view.frame.size.width-2*kSCALE_WIDTH(30), 20)];
        [pwdLabel setText:@"密码"];
        [pwdLabel setTextColor:[UIColor whiteColor]];
        [pwdLabel setFont:[UIFont systemFontOfSize:13.5]];
        [pwdLabel setTextAlignment:NSTextAlignmentLeft];
        [view addSubview:pwdLabel];
        
        UIView *pwdView=[[UIView alloc]initWithFrame:CGRectMake(kSCALE_WIDTH(20), CGRectGetMaxY(pwdLabel.frame)+5, view.frame.size.width-2*kSCALE_WIDTH(20), kSCALE_HEIGHT(30))];
        [pwdView.layer setBorderColor:kGetColor(42, 56, 78).CGColor];
        [pwdView.layer setBorderWidth:1];
        [view addSubview:pwdView];
        
        pwdTextField=[[UITextField alloc]initWithFrame:CGRectMake(10, 0, pwdView.frame.size.width-20, pwdView.frame.size.height)];
        [pwdView addSubview:pwdTextField];
        [pwdTextField setFont:[UIFont systemFontOfSize:13.5]];
        [pwdTextField setTextColor:kGetColor(92, 102, 114)];
        [pwdTextField setBackgroundColor:[UIColor clearColor]];
        [pwdTextField setAttributedPlaceholder:[self setMyPlaceHolder:@"请输入密码"]];
        

        UIView *bottomLine=[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(pwdView.frame)+kSCALE_HEIGHT(15), view.frame.size.width, 1)];
        [bottomLine setBackgroundColor:kGetColor(42, 56, 78)];
        [view addSubview:bottomLine];
        
        UIView *verLine=[[UIView alloc]initWithFrame:CGRectMake(view.frame.size.width/2-1/2, CGRectGetMaxY(bottomLine.frame), 1, view.frame.size.height-CGRectGetMaxY(bottomLine.frame))];
        [verLine setBackgroundColor:kGetColor(42, 56, 78)];
        [view addSubview:verLine];
        
        
       
        

        sureBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [sureBtn setFrame:CGRectMake(0, CGRectGetMaxY(bottomLine.frame), view.frame.size.width/2, verLine.frame.size.height)];
        [sureBtn setTitle:@"确认" forState:UIControlStateNormal];
        [sureBtn.titleLabel setFont:[UIFont systemFontOfSize:13.5]];
        [sureBtn.titleLabel setTextColor:kGetColor(94, 120, 160)];
        [sureBtn addTarget:self action:@selector(sureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:sureBtn];
        
        

        cancelBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [cancelBtn setFrame:CGRectMake(CGRectGetMaxX(verLine.frame), CGRectGetMaxY(bottomLine.frame), view.frame.size.width/2, verLine.frame.size.height)];
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [cancelBtn.titleLabel setFont:[UIFont systemFontOfSize:13.5]];
        [cancelBtn.titleLabel setTextColor:kGetColor(94, 120, 160)];
        [cancelBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:cancelBtn];
        
        [self addSubview:view];
        
    }
    return self;
}

-(void)sureBtnClick:(id)sender
{
    self.sureBlock(sender);
  
}
-(void)cancelBtnClick:(id)sender{
    
    self.cancelBlock(sender);
}
-(void)show{
    
    [self makeKeyAndVisible];
}
-(void)dismiss{
    
    [self setHidden:YES];
    [self resignKeyWindow];
}

//设置uitextfield的placeHolder的颜色为白色
-(NSMutableAttributedString *)setMyPlaceHolder:(NSString *)str{
    
    NSMutableAttributedString* placeHolderStr = [[NSMutableAttributedString alloc] initWithString:str];
    [placeHolderStr addAttribute:NSUnderlineStyleAttributeName
                           value:@(NSUnderlineStyleNone)
                           range:(NSRange){0,[placeHolderStr length]}];
    [placeHolderStr addAttribute:NSForegroundColorAttributeName value:kGetColor(92, 102, 114)  range:NSMakeRange(0,[placeHolderStr length])];
    return placeHolderStr;
    
}
@end
