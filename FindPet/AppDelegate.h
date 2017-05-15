//
//  AppDelegate.h
//  FindPet
//
//  Created by tungnd on 3/11/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMDrawerController/MMDrawerController.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) UITabBarController *tabbarController;
@property (nonatomic, strong) MMDrawerController *drawerController;
@property (nonatomic, strong) UIStoryboard *mainStoryBoard;

@end

