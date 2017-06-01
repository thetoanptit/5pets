//
//  FPProfileViewController.m
//  FindPet
//
//  Created by ifis on 5/17/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import "FPProfileViewController.h"


@interface FPProfileViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgPet;
@property (weak, nonatomic) IBOutlet UIImageView *imgOwner;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation FPProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    self.tabBarController.tabBar.hidden = YES;
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.view layoutIfNeeded];
    self.imgPet.layer.cornerRadius = self.imgPet.frame.size.width/2;
    self.imgPet.layer.masksToBounds = YES;
    self.imgPet.layer.borderWidth = 2.0;
    self.imgPet.layer.borderColor = [UIColor clearColor].CGColor;
    
    self.imgOwner.layer.cornerRadius = self.imgOwner.frame.size.width/2;
    self.imgOwner.layer.masksToBounds = YES;
    self.imgOwner.layer.borderWidth = 2.0;
    self.imgOwner.layer.borderColor = [UIColor clearColor].CGColor;
}



@end
