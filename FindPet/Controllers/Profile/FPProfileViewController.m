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
    // Do any additional setup after loading the view.
      
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
