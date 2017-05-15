//
//  FPNewController.m
//  FindPet
//
//  Created by tungnd on 3/20/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import <XLPagerTabStrip/XLPagerTabStripViewController.h>
#import <Masonry/Masonry.h>
#import <UITextView+Placeholder/UITextView+Placeholder.h>

#import "FPNewController.h"
#import "FPNewCell.h"
#import "FPConstant.h"

@interface FPNewController ()<XLPagerTabStripChildItem, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UITextView *textView;

@end

@implementation FPNewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.estimatedRowHeight = 120.0f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.textView.placeholder = @"Bạn muốn chia sẻ gì?...";
    self.textView.placeholderColor = FPBackgroundColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)titleForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController {
    return @"MỚI NHẤT";
}

- (UIColor *)colorForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController {
    return [UIColor whiteColor];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FPNewCell *cell = [tableView dequeueReusableCellWithIdentifier:kFPNewCellIdentifier forIndexPath:indexPath];
    [self configCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configCell:(FPNewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    cell.avataImageView.image = [UIImage imageNamed:@"bg"];
    cell.nameLabel.text = @"Chung Tu Dan";
    cell.timeLabel.text = @"1 giờ trước";
    cell.locationLabel.text = @"2km away";
    cell.commentLabel.text = @"Nền nhà cao hơn vỉa hè khoảng 1,4 m sau khi bậc tam cấp bị phá vì lấn chiếm, hàng chục hộ dân trên đường";
    cell.numberLikeLabel.text = @"8";
    cell.numberCommentLabel.text = @"2";
    cell.numberShareLabel.text = @"1";
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
