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
#import <SVProgressHUD/SVProgressHUD.h>
#import "FPLoginController.h"
#import "AppDelegate.h"
#import <AFNetworking.h>
#import "Logging.h"
#import "FPAccountModel.h"
#import "FPAccountManager.h"

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
    
    LogTrace(@"OUT");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    LogTrace(@"IN");
    // Dispose of any resources that can be recreated.
    
    LogTrace(@"OUT");
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

    LogTrace(@"OUT");
}


- (IBAction)loginButton_Clicked:(UIButton *)sender {
    LogTrace(@"IN");
    [SVProgressHUD showWithStatus:@"Đang đăng nhập"];
    NSURL *URL = [NSURL URLWithString:@"http://api.5pet.vn/api/Login/Login"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *param = @{  @"username" : self.usernameTextField.text,
                              @"password" : self.passwordTextField.text
                              };
    [manager POST:URL.absoluteString parameters:param progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSInteger susscess = [[responseObject objectForKey:@"Success"] integerValue];
        if (susscess == 1) {
            AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            [appDelegate showHomeViewController];
            [SVProgressHUD dismiss];
            //Save account to Realm
            FPAccountModel *accountModel = [[FPAccountModel alloc] init];
            NSDictionary *dataAccount = responseObject[@"Data"];
            accountModel.email = dataAccount[@"Email"];
            accountModel.avatar = dataAccount[@"Avatar"];
            accountModel.password = dataAccount[@"Password"];
            accountModel.addDate = dataAccount[@"AddDate"];
            accountModel.loginLast = dataAccount[@"LoginLast"];
            accountModel.changePassLast = dataAccount[@"ChangePassLast"];
            accountModel.fullName = dataAccount[@"FullName"];
            accountModel.phone = dataAccount[@"Phone"];
            accountModel.address = dataAccount[@"Address"];
            accountModel.birthday = dataAccount[@"BirthDay"];
            accountModel.sex = dataAccount[@"Sex"];
            accountModel.city = dataAccount[@"City"];
            accountModel.distric = dataAccount[@"Distric"];
            accountModel.fbID = dataAccount[@"fbID"];
            accountModel.ssID = dataAccount[@"ssID"];
            accountModel.latitude = [dataAccount[@"Latitude"] floatValue];
            accountModel.longtitude = [dataAccount[@"Longtitude"] floatValue];
            accountModel.distant = [dataAccount[@"Distant"] floatValue];
            accountModel.fcm_token = dataAccount[@"fcm_token"];
            
            [FPAccountManager insertAccountWithFPAccountModel:accountModel];
            
        } else {
            [SVProgressHUD showErrorWithStatus:@"Sai mật khẩu hoặc password!"];
        }

    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [SVProgressHUD showErrorWithStatus:@"Đăng nhập lỗi"];
    }];
    


    
    LogTrace(@"OUT");
}


- (IBAction)onLoginWithFBButtonTapped:(UIButton *)sender {
    LogTrace(@"IN");
    FBSDKLoginManager *fbLogin = [[FBSDKLoginManager alloc] init];
    [fbLogin logInWithPublishPermissions:@[@"publish_actions"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        LogTrace(@"Result: %@", result.token.userID);
    }];
    LogTrace(@"OUT");
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
