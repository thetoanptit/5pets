//
//  FPListPetController.m
//  FindPet
//
//  Created by tungnd on 3/21/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import "FPListPetController.h"
#import "FPPetCell.h"

@interface FPListPetController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation FPListPetController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
}

- (void)configUI {
    self.title = @"Danh sách PET";
    
    [self.tableView registerNib:[UINib nibWithNibName:kFPPetCellIdentifier bundle:nil] forCellReuseIdentifier:kFPPetCellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 165.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FPPetCell *cell = [tableView dequeueReusableCellWithIdentifier:kFPPetCellIdentifier forIndexPath:indexPath];
    [self configCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configCell:(FPPetCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.pictureImage.image = [UIImage imageNamed:@"bg"];
    cell.nameLabel.text = @"Không gì là không thể";
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
