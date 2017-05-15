//
//  FPSomeUsersController.m
//  FindPet
//
//  Created by tungnd on 3/18/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import "FPSomeUsersController.h"

@interface FPSomeUsersController ()

@end

@implementation FPSomeUsersController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
}

- (void)configUI {
    self.title = @"Người dùng quanh đây";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
