//
//  FPProfileContainerViewController.m
//  FindPet
//
//  Created by ifis on 5/17/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import "FPProfileContainerViewController.h"
#import "FPInformationViewController.h"
#import "FPPictureViewController.h"
#import "FPContactViewController.h"
#import "FPConstant.h"

@interface FPProfileContainerViewController ()

@end

@implementation FPProfileContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.buttonBarView.backgroundColor = UIColorFromHex(0xE2E2E2);
    self.buttonBarView.shouldCellsFillAvailableWidth = YES;
    self.buttonBarView.selectedBar.backgroundColor = [UIColor whiteColor];
    self.buttonBarView.selectedBarHeight = 2;
    self.buttonBarView.selectedBarAlignment = XLSelectedBarAlignmentCenter;
    
    self.changeCurrentIndexBlock = ^(XLButtonBarViewCell* oldCell, XLButtonBarViewCell *newCell, BOOL animated){
        oldCell.label.font = [UIFont systemFontOfSize:12.0f weight:UIFontWeightLight];
        newCell.label.font = [UIFont systemFontOfSize:12.0f weight:UIFontWeightRegular];
        
        [oldCell.label setTextColor:FPBackgroundColor];
        [newCell.label setTextColor:FPBackgroundColor];
        
        [newCell setBackgroundColor:[UIColor whiteColor]];
        [oldCell setBackgroundColor:UIColorFromHex(0xE2E2E2)];
        
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

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)childViewControllersForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController {
    UIStoryboard *profileStoryboard = [UIStoryboard storyboardWithName:@"Profile" bundle:nil];
    UIViewController *infoViewController = [profileStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([FPInformationViewController class])];
    UIViewController *pictureViewController = [profileStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([FPPictureViewController class])];
    UIViewController *contactViewController = [profileStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([FPContactViewController class])];
    
    return @[infoViewController, pictureViewController, contactViewController];
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
