//
//  FPInformationViewController.m
//  FindPet
//
//  Created by ifis on 5/17/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import "FPInformationViewController.h"
#import <XLPagerTabStrip/XLPagerTabStripViewController.h>
#import <Masonry/Masonry.h>
#import <UITextView+Placeholder/UITextView+Placeholder.h>
#import "Logging.h"
#import "FPProfileSingleTableViewCell.h"
#import "FPProfileCoupleTableViewCell.h"
#import "FPConst.h"

@interface FPInformationViewController ()<XLPagerTabStripChildItem, UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FPInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LogTrace(@"IN");
    [self.navigationController setNavigationBarHidden:YES];
    self.tabBarController.tabBar.hidden = YES;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([FPProfileSingleTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([FPProfileSingleTableViewCell class])];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([FPProfileCoupleTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([FPProfileCoupleTableViewCell class])];
    
    LogTrace(@"OUT");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - XLPagerTabStrip
- (NSString *)titleForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController {
    LogTrace(@"IN-OUT");
    return @"Thông tin";
}

- (UIColor *)colorForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController {
    LogTrace(@"IN-OUT");
    return [UIColor whiteColor];
}


#pragma mark - UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case FPCellProfileInformationSpecies: {
            FPProfileSingleTableViewCell *cell = (FPProfileSingleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FPProfileSingleTableViewCell class])];
            cell.lblTitle.text = @"Loài";
            cell.lblDetail.text = @"Chó";
            return cell;
        }
        case FPCellProfileInformationBred:{
            FPProfileSingleTableViewCell *cell = (FPProfileSingleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FPProfileSingleTableViewCell class])];
            cell.lblTitle.text = @"Giống";
            cell.lblDetail.text = @"Bắc kinh lai";
            return cell;
        }
        case FPCellProfileInformationParents: {
            FPProfileCoupleTableViewCell *cell = (FPProfileCoupleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FPProfileCoupleTableViewCell class])];
            cell.lblTitle1.text = @"Cha";
            cell.lblTitle2.text = @"Mẹ";
            cell.lblDetail1.text = @"Bắc Kinh";
            cell.lblDetail2.text = @"Nhật lông dài";
            return cell;
        }
        case FPCellProfileInformationGender: {
            FPProfileSingleTableViewCell *cell = (FPProfileSingleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FPProfileSingleTableViewCell class])];
            cell.lblTitle.text = @"Giới tính";
            cell.lblDetail.text = @"Đực";
            return cell;
        }
        case FPCellProfileInformationBirth: {
            FPProfileCoupleTableViewCell *cell = (FPProfileCoupleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FPProfileCoupleTableViewCell class])];
            cell.lblTitle1.text = @"Ngày sinh";
            cell.lblTitle2.text = @"Tuổi";
            cell.lblDetail1.text = @"2/9/2016";
            cell.lblDetail2.text = @"8 tháng";
            return cell;
        }
        case FPCellProfileInformationCoatColor: {
            FPProfileSingleTableViewCell *cell = (FPProfileSingleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FPProfileSingleTableViewCell class])];
            cell.lblTitle.text = @"Màu";
            cell.lblDetail.text = @"Vàng rơm";
            return cell;
        }
        default: {
            FPProfileCoupleTableViewCell *cell = (FPProfileCoupleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FPProfileCoupleTableViewCell class])];
            cell.lblTitle1.text = @"Tiêm phòng";
            cell.lblTitle2.text = @"Ngày tiêm";
            cell.lblDetail1.text = @"Vắc xin AAA";
            cell.lblDetail2.text = @"1/1/2017";
            return cell;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.00001f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.00001f;
}


@end
