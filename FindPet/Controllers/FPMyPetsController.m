//
//  FPMyPetsController.m
//  FindPet
//
//  Created by tungnd on 3/18/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import <FontAwesomeKit/FontAwesomeKit.h>

#import "FPMyPetsController.h"
#import "FPMenuCell.h"

@interface FPMyPetsController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation FPMyPetsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
}

- (void)configUI {
    self.title = @"PET của tôi";
    
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerNib:[UINib nibWithNibName:kFPMenuCellIdentifier bundle:nil] forCellReuseIdentifier:kFPMenuCellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FPMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:kFPMenuCellIdentifier forIndexPath:indexPath];
    [self configCell:cell forIndexPath:indexPath];
    return cell;
}

- (void)configCell:(FPMenuCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    FAKIcon *icon;
    NSString *title;
    switch (indexPath.row) {
        case 0: {
            title = @"Danh mục pet";
            icon = [FAKIonIcons iosPawOutlineIconWithSize:25];
            break;
        }
        case 1: {
            title = @"Quét Bluetooth";
            icon = [FAKIonIcons bluetoothIconWithSize:25];
            break;
        }
        case 2: {
            title = @"Quét QR Code";
            icon = [FAKIonIcons iosBarcodeOutlineIconWithSize:25];
            break;
        }
        case 3: {
            title = @"Bản đồ 5PET";
            icon = [FAKIonIcons iosLocationOutlineIconWithSize:25];
            break;
        }
        default:
            break;
    }
    [icon setAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    cell.image.image = [icon imageWithSize:CGSizeMake(25, 25)];
    cell.label.text = title;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0: {
            [self performSegueWithIdentifier:@"showListPetSegue" sender:self];
            break;
        }
        case 1: {
            [self performSegueWithIdentifier:@"showScanBluetoothSegue" sender:self];
            break;
        }
        default:
            break;
    }
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
