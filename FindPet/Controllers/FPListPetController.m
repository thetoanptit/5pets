//
//  FPListPetController.m
//  FindPet
//
//  Created by tungnd on 3/21/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import "FPListPetController.h"
#import "FPPetCell.h"
#import "Logging.h"
#import "FPProfileViewController.h"

@interface FPListPetController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation FPListPetController

- (void)viewDidLoad {
    [super viewDidLoad];
    LogTrace(@"IN");
    [self configUI];
    LogTrace(@"OUT");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)configUI {
    LogTrace(@"IN");
    self.title = @"Danh sách PET";
    self.tabBarController.tabBar.hidden = YES;
    
    [self.tableView registerNib:[UINib nibWithNibName:kFPPetCellIdentifier bundle:nil] forCellReuseIdentifier:kFPPetCellIdentifier];
    LogTrace(@"OUT");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    LogTrace(@"IN");
    // Dispose of any resources that can be recreated.
    LogTrace(@"OUT");
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    LogTrace(@"IN-OUT");
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    LogTrace(@"IN-OUT");
    return 165.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LogTrace(@"IN");
    FPPetCell *cell = [tableView dequeueReusableCellWithIdentifier:kFPPetCellIdentifier forIndexPath:indexPath];
    [self configCell:cell atIndexPath:indexPath];
    LogTrace(@"OUT");
    return cell;
}

- (void)configCell:(FPPetCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    LogTrace(@"IN");
    cell.pictureImage.image = [UIImage imageNamed:@"bg"];
    cell.nameLabel.text = @"Không gì là không thể";
    LogTrace(@"OUT");
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LogTrace(@"IN");
    UIStoryboard *profileStoryboard = [UIStoryboard storyboardWithName:@"Profile" bundle:nil];
    FPProfileViewController *profileViewController = [profileStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([FPProfileViewController class])];
    
    [self.navigationController pushViewController:profileViewController animated:YES];
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
