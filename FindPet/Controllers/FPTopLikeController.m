//
//  FPTopLikeController.m
//  FindPet
//
//  Created by tungnd on 3/20/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import <XLPagerTabStrip/XLPagerTabStripViewController.h>

#import "FPTopLikeController.h"
#import "Logging.h"

@interface FPTopLikeController ()<XLPagerTabStripChildItem>

@end

@implementation FPTopLikeController

- (void)viewDidLoad {
    [super viewDidLoad];
    LogTrace(@"IN");
    // Do any additional setup after loading the view.
    LogTrace(@"OUT");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    LogTrace(@"IN");
    // Dispose of any resources that can be recreated.
    LogTrace(@"OUT");
}

- (NSString *)titleForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController {
    LogTrace(@"IN-OUT");
    return @"TOP LIKE";
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
