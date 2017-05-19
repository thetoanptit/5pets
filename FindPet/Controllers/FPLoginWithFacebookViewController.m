//
//  FPLoginWithFacebookViewController.m
//  FindPet
//
//  Created by ifis on 5/18/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import "FPLoginWithFacebookViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "Logging.h"
#import "AppDelegate.h"

@interface FPLoginWithFacebookViewController ()<FBSDKGraphRequestConnectionDelegate>
//@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;
@end

@implementation FPLoginWithFacebookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    if ([FBSDKAccessToken currentAccessToken]) {
        LogTrace(@"UserID: %@", [FBSDKAccessToken currentAccessToken].userID);
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate showHomeViewController];
    } else {
        FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
        loginButton.center = self.view.center;
        [self.view addSubview:loginButton];
    }
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    LogTrace(@"IN");
    if ([FBSDKAccessToken currentAccessToken]) {
        LogTrace(@"UserID: %@", [FBSDKAccessToken currentAccessToken].userID);
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate showHomeViewController];
    } else {
        FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
        loginButton.center = self.view.center;
        [self.view addSubview:loginButton];
    }
    LogTrace(@"OUT");
}

//- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {
//    if ([FBSDKAccessToken currentAccessToken]) {
//        LogTrace(@"FbID:%@", [FBSDKAccessToken currentAccessToken].userID);
//    }
//}

- (void)requestConnectionDidFinishLoading:(FBSDKGraphRequestConnection *)connection {
    LogTrace(@"FbID:%@", [FBSDKAccessToken currentAccessToken].userID);

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
