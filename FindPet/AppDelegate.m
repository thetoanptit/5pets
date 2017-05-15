//
//  AppDelegate.m
//  FindPet
//
//  Created by tungnd on 3/11/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import <FontAwesomeKit/FontAwesomeKit.h>

#import "AppDelegate.h"
#import "FPConstant.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window.rootViewController = self.drawerController;
    
    [[UINavigationBar appearance] setBarTintColor:FPBackgroundColor];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (UITabBarController *)tabbarController {
    if (!_tabbarController) {
        
        FAKIonIcons *icon = [FAKIonIcons iosPaperOutlineIconWithSize:25];
        CGSize iconsize = CGSizeMake(25, 25);
        
        UINavigationController *home = [self.mainStoryBoard instantiateViewControllerWithIdentifier:@"FPHomeNavigationController"];
        home.tabBarItem.image = [icon imageWithSize:iconsize];
        
        icon = [FAKIonIcons iosPeopleOutlineIconWithSize:25];
        UINavigationController *some = [[UINavigationController alloc] initWithRootViewController:[self.mainStoryBoard instantiateViewControllerWithIdentifier:@"FPSomeUsersController"]];
        some.tabBarItem.image = [icon imageWithSize:iconsize];
        
        icon = [FAKIonIcons iosBriefcaseOutlineIconWithSize:25];
        UINavigationController *booth = [[UINavigationController alloc] initWithRootViewController:[self.mainStoryBoard instantiateViewControllerWithIdentifier:@"FPBoothController"]];
        booth.tabBarItem.image = [icon imageWithSize:iconsize];
        
        icon = [FAKIonIcons iosPawOutlineIconWithSize:25];
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PetStoryboard" bundle:nil];
        UINavigationController *mypet = [storyboard instantiateInitialViewController];
        
        mypet.tabBarItem.image = [icon imageWithSize:iconsize];
        
        _tabbarController = [[UITabBarController alloc] init];
        [_tabbarController setAutomaticallyAdjustsScrollViewInsets:YES];
        [_tabbarController setViewControllers:@[home, some, booth, mypet]];
    }
    return _tabbarController;
}

- (MMDrawerController *)drawerController {
    if (!_drawerController) {
        UIViewController *leftMenu = [self.mainStoryBoard instantiateViewControllerWithIdentifier:@"FPLeftMenuController"];
        _drawerController = [[MMDrawerController alloc] initWithCenterViewController:self.tabbarController leftDrawerViewController:leftMenu];
        _drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
        _drawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
        _drawerController.showsShadow = NO;
    }
    
    return _drawerController;
}

- (UIStoryboard *)mainStoryBoard {
    if (!_mainStoryBoard) {
        _mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    }
    return _mainStoryBoard;
}

@end
