//
//  FPSomeUsersController.m
//  FindPet
//
//  Created by tungnd on 3/18/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import "FPSomeUsersController.h"
#import "Logging.h"

@interface FPSomeUsersController ()

@end

@implementation FPSomeUsersController

- (void)viewDidLoad {
    [super viewDidLoad];
    LogTrace(@"IN");
    [self configUI];
    
    LogDebug(@"OUT");
}

- (void)configUI {
    LogTrace(@"IN");
    
    LogDebug(@"OUT");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    LogTrace(@"IN");
    // Dispose of any resources that can be recreated.
    
    LogDebug(@"OUT");
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    LogTrace(@"IN-OUT");
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
