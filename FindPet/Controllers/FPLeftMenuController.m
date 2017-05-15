//
//  FPLeftMenuController.m
//  FindPet
//
//  Created by tungnd on 3/20/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import <FontAwesomeKit/FontAwesomeKit.h>

#import "FPLeftMenuController.h"
#import "FPMenuCell.h"

@interface FPLeftMenuController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIImageView *avataImageView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;

@end

@implementation FPLeftMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configUI {
    self.tableView.tableFooterView = [UIView new];
    
    self.avataImageView.image = [UIImage imageNamed:@"bg"];
    self.avataImageView.layer.borderWidth = 1;
    self.avataImageView.layer.cornerRadius = 35;
    self.avataImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.avataImageView.layer.masksToBounds = YES;
    
    self.nameLabel.text = [@"Trần Mỹ Anh" uppercaseString];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FPMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:kFPMenuCellIdentifier forIndexPath:indexPath];
    [self configCell:cell forIndexPath:indexPath];
    return cell;
}

- (void)configCell:(FPMenuCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    FAKIonIcons *icon;
    NSString *title;
    switch (indexPath.row) {
        case 0: {
            title = @"Thiết lập";
            icon = [FAKIonIcons iosGearOutlineIconWithSize:25];
            break;
        }
        case 1: {
            title = @"Giới thiệu bạn bè";
            icon = [FAKIonIcons androidShareAltIconWithSize:25];
            break;
        }
        case 2: {
            title = @"Đánh giá ứng dụng";
            icon = [FAKIonIcons iosStarOutlineIconWithSize:25];
            break;
        }
        case 3: {
            title = @"Phản hồi";
            icon = [FAKIonIcons iosEmailOutlineIconWithSize:25];
            break;
        }
        case 4: {
            title = @"Thông tin ứng dụng";
            icon = [FAKIonIcons informationCircledIconWithSize:25];
            break;
        }
        case 5: {
            title = @"Đổi mật khẩu";
            icon = [FAKIonIcons iosLockedOutlineIconWithSize:25];
            break;
        }
        case 6: {
            title = @"Thoát";
            icon = [FAKIonIcons logOutIconWithSize:25];
            break;
        }
        default:
            break;
    }
    [icon setAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    cell.image.image = [icon imageWithSize:CGSizeMake(25, 25)];
    cell.label.text = title;
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
