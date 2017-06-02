//
//  FPProfileViewController.m
//  FindPet
//
//  Created by ifis on 5/17/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import "FPProfileViewController.h"
#import "Logging.h"

@interface FPProfileViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgPet;
@property (weak, nonatomic) IBOutlet UIImageView *imgOwner;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *btnFindPet;
@property (weak, nonatomic) IBOutlet UIButton *btnFindPet1;
@property (weak, nonatomic) IBOutlet UIButton *btnPetLocation;
@property (weak, nonatomic) IBOutlet UIButton *btnPetLocation1;

@property (weak, nonatomic) IBOutlet UIButton *btnEditProfile;
@property (weak, nonatomic) IBOutlet UIButton *btnDoneProfile;

@end

@implementation FPProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LogTrace(@"IN");
    [self.navigationController setNavigationBarHidden:YES];
    self.btnDoneProfile.hidden = YES;
    
    LogTrace(@"OUT");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    LogTrace(@"IN");
    [self.view layoutIfNeeded];
    self.imgPet.layer.cornerRadius = self.imgPet.frame.size.width/2;
    self.imgPet.layer.masksToBounds = YES;
    self.imgPet.layer.borderWidth = 2.0;
    self.imgPet.layer.borderColor = [UIColor clearColor].CGColor;
    
    self.imgOwner.layer.cornerRadius = self.imgOwner.frame.size.width/2;
    self.imgOwner.layer.masksToBounds = YES;
    self.imgOwner.layer.borderWidth = 2.0;
    self.imgOwner.layer.borderColor = [UIColor clearColor].CGColor;
    LogTrace(@"OUT");
}


- (IBAction)btnBack_Clicked:(UIButton *)sender {
    LogTrace(@"IN");
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController setNavigationBarHidden:NO];
    LogTrace(@"OUT");
}

- (IBAction)btnPetLocation_Clicked:(UIButton *)sender {
    LogTrace(@"IN");
    LogTrace(@"OUT");
}
- (IBAction)btnFindPet:(id)sender {
    LogTrace(@"IN");
    LogTrace(@"OUT");
}


- (IBAction)editProfile:(id)sender {
    LogTrace(@"IN");
    [self setHiddenButtonWithStatus:YES];
    
    LogTrace(@"OUT");
}

- (IBAction)btnDoneProfile_Clicked:(UIButton *)sender {
    LogTrace(@"IN");
    [self setHiddenButtonWithStatus:NO];
    
    LogTrace(@"OUT");
}

- (void) setHiddenButtonWithStatus:(BOOL)isHidden {
    LogTrace(@"IN");
    self.btnFindPet.hidden = isHidden;
    self.btnFindPet1.hidden = isHidden;
    self.btnPetLocation.hidden = isHidden;
    self.btnPetLocation1.hidden = isHidden;
    self.btnEditProfile.hidden = isHidden;
    self.btnDoneProfile.hidden = !isHidden;
    
    LogTrace(@"OUT");
}

@end
