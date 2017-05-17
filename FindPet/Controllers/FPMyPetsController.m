//
//  FPMyPetsController.m
//  FindPet
//
//  Created by tungnd on 3/18/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import <FontAwesomeKit/FontAwesomeKit.h>
#import <MMDrawerController/UIViewController+MMDrawerController.h>
#import "FPMyPetsController.h"
#import "FPMenuCell.h"
#import "Logging.h"
#import "FPListPetController.h"

@interface FPMyPetsController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation FPMyPetsController

- (void)viewDidLoad {
    [super viewDidLoad];
    LogTrace(@"IN");
    [self configUI];
    LogTrace(@"OUT");
}

- (void)configUI {
    LogTrace(@"IN");
    self.title = @"PET của tôi";
    self.tableView.tableFooterView = [UIView new];
    FAKIonIcons *icon = [FAKIonIcons naviconIconWithSize:30];
    [icon setAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[icon imageWithSize:CGSizeMake(30, 30)] style:UIBarButtonItemStylePlain target:self action:@selector(onMenuButtonTapped)];
    self.navigationItem.leftBarButtonItem = menuButton;
    
    icon = [FAKIonIcons iosSearchIconWithSize:30];
    [icon setAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithImage:[icon imageWithSize:CGSizeMake(30, 30)] style:UIBarButtonItemStylePlain target:self action:@selector(onSearchButtonTapped)];
    self.navigationItem.rightBarButtonItem = searchButton;
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.tableView registerNib:[UINib nibWithNibName:kFPMenuCellIdentifier bundle:nil] forCellReuseIdentifier:kFPMenuCellIdentifier];
    LogTrace(@"OUT");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    LogTrace(@"IN");
    // Dispose of any resources that can be recreated.
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


#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    LogTrace(@"IN-OUT");
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    LogTrace(@"IN-OUT:50.0f");
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
    LogTrace(@"OUT");
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LogTrace(@"IN");
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PetStoryboard" bundle:nil];
    switch (indexPath.row) {
        case 0: {
            FPListPetController *listPetController = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([FPListPetController class])];
            [self.navigationController pushViewController:listPetController animated:YES];
            break;
        }
        case 1: {
            [self performSegueWithIdentifier:@"showScanBluetoothSegue" sender:self];
            break;
        }
        default:
            break;
    }
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
