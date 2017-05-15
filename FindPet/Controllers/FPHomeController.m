//
//  FPHomeController.m
//  FindPet
//
//  Created by tungnd on 3/11/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import <LSBLEManager/LSBluetoothManager.h>
#import <FontAwesomeKit/FontAwesomeKit.h>
#import <MMDrawerController/UIViewController+MMDrawerController.h>

#import "FPHomeController.h"
#import "AppDelegate.h"
#import "FPConstant.h"

@interface FPHomeController ()

@end

@implementation FPHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
}
    

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)configUI {
    
    self.title = @"Tin tức";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    FAKIonIcons *icon = [FAKIonIcons naviconIconWithSize:30];
    [icon setAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[icon imageWithSize:CGSizeMake(30, 30)] style:UIBarButtonItemStylePlain target:self action:@selector(onMenuButtonTapped)];
    self.navigationItem.leftBarButtonItem = menuButton;
    
    icon = [FAKIonIcons iosSearchIconWithSize:30];
    [icon setAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithImage:[icon imageWithSize:CGSizeMake(30, 30)] style:UIBarButtonItemStylePlain target:self action:@selector(onSearchButtonTapped)];
    self.navigationItem.rightBarButtonItem = searchButton;
    
    self.buttonBarView.backgroundColor = FPBackgroundColor;
    self.buttonBarView.shouldCellsFillAvailableWidth = YES;
    self.buttonBarView.selectedBar.backgroundColor = [UIColor whiteColor];
    self.buttonBarView.selectedBarHeight = 2;
    self.buttonBarView.selectedBarAlignment = XLSelectedBarAlignmentCenter;
    
    self.changeCurrentIndexBlock = ^(XLButtonBarViewCell* oldCell, XLButtonBarViewCell *newCell, BOOL animated){
        oldCell.label.font = [UIFont systemFontOfSize:12.0f weight:UIFontWeightLight];
        newCell.label.font = [UIFont systemFontOfSize:12.0f weight:UIFontWeightRegular];
        
        [oldCell.label setTextColor:[UIColor colorWithWhite:1 alpha:0.6]];
        [newCell.label setTextColor:[UIColor whiteColor]];
        
        if (animated) {
            [UIView animateWithDuration:0.1
                             animations:^(){
                                 newCell.transform = CGAffineTransformMakeScale(1.0, 1.0);
                                 oldCell.transform = CGAffineTransformMakeScale(0.8, 0.8);
                             }
                             completion:nil];
        }
        else{
            newCell.transform = CGAffineTransformMakeScale(1.0, 1.0);
            oldCell.transform = CGAffineTransformMakeScale(0.8, 0.8);
        }
    };
}

- (void)onMenuButtonTapped {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    
}

- (void)onSearchButtonTapped {

}

#pragma mark - XLPagerTabStripViewControllerDelegate, XLPagerTabStripViewControllerDataSource

- (NSArray *)childViewControllersForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController {
    UIStoryboard *storyboard = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).mainStoryBoard;
    UIViewController *newController = [storyboard instantiateViewControllerWithIdentifier:@"FPNewController"];
    UIViewController *topLikeController = [storyboard instantiateViewControllerWithIdentifier:@"FPTopLikeController"];
    UIViewController *topShareController = [storyboard instantiateViewControllerWithIdentifier:@"FPTopShareController"];
    UIViewController *petStrayController = [storyboard instantiateViewControllerWithIdentifier:@"FPPetStrayController"];
    return @[newController, topLikeController, topShareController, petStrayController];
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
