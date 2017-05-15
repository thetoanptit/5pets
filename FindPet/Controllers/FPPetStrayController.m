//
//  FPStrayController.m
//  FindPet
//
//  Created by tungnd on 3/20/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import <XLPagerTabStrip/XLPagerTabStripViewController.h>

#import "FPPetStrayController.h"

@interface FPPetStrayController ()<XLPagerTabStripChildItem>

@end

@implementation FPPetStrayController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)titleForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController {
    return @"DS PET LẠC";
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
