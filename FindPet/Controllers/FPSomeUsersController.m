//
//  FPSomeUsersController.m
//  FindPet
//
//  Created by tungnd on 3/18/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import "FPSomeUsersController.h"
#import "Logging.h"
#import <MMDrawerController/UIViewController+MMDrawerController.h>
#import <FontAwesomeKit/FontAwesomeKit.h>

@interface FPSomeUsersController ()

@end

@implementation FPSomeUsersController

- (void)viewDidLoad {
    [super viewDidLoad];
    LogTrace(@"IN");
    [self configUI];
    
    LogTrace(@"OUT");
}

- (void)configUI {
    LogTrace(@"IN");
    self.title = @"Người dùng quanh đây";
    
    FAKIonIcons *icon = [FAKIonIcons naviconIconWithSize:30];
    [icon setAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[icon imageWithSize:CGSizeMake(30, 30)] style:UIBarButtonItemStylePlain target:self action:@selector(onMenuButtonTapped)];
    self.navigationItem.leftBarButtonItem = menuButton;
    
    icon = [FAKIonIcons iosSearchIconWithSize:30];
    [icon setAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithImage:[icon imageWithSize:CGSizeMake(30, 30)] style:UIBarButtonItemStylePlain target:self action:@selector(onSearchButtonTapped)];
    self.navigationItem.rightBarButtonItem = searchButton;
    
    LogTrace(@"OUT");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    LogTrace(@"IN");
    // Dispose of any resources that can be recreated.
    
    LogTrace(@"OUT");
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    LogTrace(@"IN-OUT");
    return UIStatusBarStyleLightContent;
}

- (void)onMenuButtonTapped {
    LogTrace(@"IN");
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    LogTrace(@"OUT");
    
}

- (void)onSearchButtonTapped {
    LogTrace(@"IN");
    LogTrace(@"OUT");
}

@end
