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
    
    [self configUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configUI {
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

}

- (IBAction)onLoginWithFBButtonTapped:(UIButton *)sender {
    FBSDKLoginManager *fbLogin = [[FBSDKLoginManager alloc] init];
    [fbLogin logInWithReadPermissions:@[@"public_profile"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            
        } else if(result.isCancelled) {
        
        } else {
            NSLog(@"%@",result.token.tokenString);
        }
    }];
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
