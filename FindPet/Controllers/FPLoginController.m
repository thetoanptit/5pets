//
//  FPLoginController.m
//  FindPet
//
//  Created by tungnd on 3/16/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import <FontAwesomeKit/FontAwesomeKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "FPLoginController.h"
#import "AppDelegate.h"
#import <AFNetworking.h>
#import "Logging.h"

@interface FPLoginController ()

@property (nonatomic, weak) IBOutlet UITextField *usernameTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;
@property (nonatomic, weak) IBOutlet UIButton *facebookButton;
@property (nonatomic, weak) IBOutlet UIButton *twitterButton;
@property (nonatomic, weak) IBOutlet UIButton *googleplusButton;
@property (nonatomic, weak) IBOutlet UIButton *instagramButton;

@end

@implementation FPLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    LogTrace(@"IN");
    [self configUI];
    // Do any additional setup after loading the view.
    
    LogDebug(@"OUT");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    LogTrace(@"IN");
    // Dispose of any resources that can be recreated.
    
    LogDebug(@"OUT");
}

- (void)configUI {
    LogTrace(@"IN");
    self.usernameTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    self.usernameTextField.layer.borderWidth = 1.0f;
    self.usernameTextField.layer.masksToBounds = YES;
    self.passwordTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    self.passwordTextField.layer.borderWidth = 1.0f;
    self.passwordTextField.layer.masksToBounds = YES;
    
    CGSize iconSize = CGSizeMake(30, 30);
    FAKIonIcons *icons = [FAKIonIcons socialFacebookOutlineIconWithSize:40];
    [self.facebookButton setImage:[icons imageWithSize:iconSize] forState:UIControlStateNormal];
    self.facebookButton.layer.cornerRadius = 25;
    self.facebookButton.layer.borderWidth = 1;
    self.facebookButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.facebookButton.layer.masksToBounds = YES;
    
    icons = [FAKIonIcons socialTwitterOutlineIconWithSize:30];
    [self.twitterButton setImage:[icons imageWithSize:iconSize] forState:UIControlStateNormal];
    self.twitterButton.layer.cornerRadius = 25;
    self.twitterButton.layer.borderWidth = 1;
    self.twitterButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.twitterButton.layer.masksToBounds = YES;

    icons = [FAKIonIcons socialGoogleplusOutlineIconWithSize:30];
    [self.googleplusButton setImage:[icons imageWithSize:iconSize] forState:UIControlStateNormal];
    self.googleplusButton.layer.cornerRadius = 25;
    self.googleplusButton.layer.borderWidth = 1;
    self.googleplusButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.googleplusButton.layer.masksToBounds = YES;

    icons = [FAKIonIcons socialInstagramOutlineIconWithSize:30];
    [self.instagramButton setImage:[icons imageWithSize:iconSize] forState:UIControlStateNormal];
    self.instagramButton.layer.cornerRadius = 25;
    self.instagramButton.layer.borderWidth = 1;
    self.instagramButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.instagramButton.layer.masksToBounds = YES;

    LogDebug(@"OUT");
}


- (IBAction)loginButton_Clicked:(UIButton *)sender {
    LogTrace(@"IN");
    NSURL *URL = [NSURL URLWithString:@"http://api.5pet.vn/api/Login/Login"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *param = @{  @"email" : @"nghi123@gmail.com",
                              @"password" : @"12345678"
                              };
    [manager GET:URL.absoluteString parameters:param progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate showHomeViewController];
    
    LogDebug(@"OUT");
}


- (IBAction)onLoginWithFBButtonTapped:(UIButton *)sender {
    LogTrace(@"IN");
    FBSDKLoginManager *fbLogin = [[FBSDKLoginManager alloc] init];
    [fbLogin logInWithReadPermissions:@[@"public_profile"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            
        } else if(result.isCancelled) {
        
        } else {
            NSLog(@"%@",result.token.tokenString);
        }
    }];
    LogDebug(@"OUT");
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
