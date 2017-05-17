//
//  FPBoothController.m
//  FindPet
//
//  Created by tungnd on 3/18/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import <FontAwesomeKit/FontAwesomeKit.h>
#import <MMDrawerController/UIViewController+MMDrawerController.h>

#import "FPBoothController.h"
#import "FPMenuCell.h"
#import "Logging.h"

@interface FPBoothController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation FPBoothController

- (void)viewDidLoad {
    [super viewDidLoad];
    LogTrace(@"IN");
    [self configUI];
    self.title = @"Gian hàng";
    LogTrace(@"OUT");
}

- (void)configUI {
    LogTrace(@"IN");
    self.tableView.tableFooterView = [UIView new];
    
    FAKIonIcons *icon = [FAKIonIcons naviconIconWithSize:30];
    [icon setAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[icon imageWithSize:CGSizeMake(30, 30)] style:UIBarButtonItemStylePlain target:self action:@selector(onMenuButtonTapped)];
    self.navigationItem.leftBarButtonItem = menuButton;
    
    icon = [FAKIonIcons iosSearchIconWithSize:30];
    [icon setAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithImage:[icon imageWithSize:CGSizeMake(30, 30)] style:UIBarButtonItemStylePlain target:self action:@selector(onSearchButtonTapped)];
    self.navigationItem.rightBarButtonItem = searchButton;
    
    
    [self.tableView registerNib:[UINib nibWithNibName:kFPMenuCellIdentifier bundle:nil] forCellReuseIdentifier:kFPMenuCellIdentifier];
    LogTrace(@"OUT");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    LogTrace(@"IN");
    // Dispose of any resources that can be recreated.
    LogTrace(@"OUT");
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    LogTrace(@"IN-OUT");
    return UIStatusBarStyleLightContent;
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    LogTrace(@"IN-OUT");
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    LogTrace(@"IN-OUT");
    return 50.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LogTrace(@"IN");
    FPMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:kFPMenuCellIdentifier forIndexPath:indexPath];
    [self configCell:cell forIndexPath:indexPath];
    LogTrace(@"OUT");
    return cell;
}

- (void)configCell:(FPMenuCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    LogTrace(@"IN");
    FAKIcon *icon;
    NSString *title;
    switch (indexPath.row) {
        case 0: {
            title = @"Sản phẩm cho chó";
            icon = [FAKFoundationIcons guideDogIconWithSize:25];
            [icon setAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
            cell.image.image = [icon imageWithSize:CGSizeMake(25, 25)];
            break;
        }
        case 1: {
            title = @"Sản phẩm cho mèo";
            icon = [FAKIonIcons bluetoothIconWithSize:25];
            cell.image.image = [UIImage imageNamed:@"ic-cat"];
            break;
        }
        case 2: {
            title = @"Sản phẩm chim kiểng";
            icon = [FAKIonIcons socialTwitterOutlineIconWithSize:25];
            [icon setAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
            cell.image.image = [icon imageWithSize:CGSizeMake(25, 25)];
            break;
        }
        case 3: {
            title = @"Sản phẩm cá kiểng";
            cell.image.image = [UIImage imageNamed:@"ic-fish"];
            break;
        }
        case 4: {
            title = @"Sản phẩm khác";
            icon = [FAKIonIcons iosBriefcaseIconWithSize:25];
            [icon setAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
            cell.image.image = [icon imageWithSize:CGSizeMake(25, 25)];
            break;
        }
        default:
            break;
    }

    cell.label.text = title;
    LogTrace(@"OUT");
}

- (void)onMenuButtonTapped {
    LogTrace(@"IN");
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    LogTrace(@"OUT");
    
}

- (void)onSearchButtonTapped {
    LogTrace(@"IN");
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
