//
//  AppDelegate.h
//  custormAlertView
//
//  Created by  ztryxh on 2018/1/9.
//  Copyright © 2018年 ebo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

