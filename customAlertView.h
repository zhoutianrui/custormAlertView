//
//  customAlertView.h
//  EBOexchange
//
//  Created by  ztryxh on 2018/1/9.
//  Copyright © 2018年 ebo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customAlertView : UIWindow
-(void)show;
-(void)dismiss;
typedef void (^sureBtnClickBlock)(UIButton *sender);
typedef void (^cancelBtnClickBlock)(UIButton *sender);
@property (nonatomic,copy) sureBtnClickBlock sureBlock;
@property (nonatomic,copy) cancelBtnClickBlock cancelBlock;
@end
