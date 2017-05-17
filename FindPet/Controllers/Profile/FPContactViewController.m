//
//  FPContactViewController.m
//  FindPet
//
//  Created by ifis on 5/17/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import "FPContactViewController.h"
#import <XLPagerTabStrip/XLPagerTabStripViewController.h>
#import <Masonry/Masonry.h>
#import <UITextView+Placeholder/UITextView+Placeholder.h>
#import "Logging.h"

@interface FPContactViewController ()<XLPagerTabStripChildItem>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FPContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)titleForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController {
    LogTrace(@"IN-OUT");
    return @"Liên hệ";
}

- (UIColor *)colorForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController {
    LogTrace(@"IN-OUT");
    return [UIColor whiteColor];
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
