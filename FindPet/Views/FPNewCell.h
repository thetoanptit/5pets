//
//  FPNewCell.h
//  FindPet
//
//  Created by tungnd on 3/20/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const kFPNewCellIdentifier = @"FPNewCell";

@interface FPNewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *avataImageView;
@property (nonatomic, weak) IBOutlet UIImageView *timeImageView;
@property (nonatomic, weak) IBOutlet UIImageView *locationImageView;
@property (nonatomic, weak) IBOutlet UIImageView *likeImageView;
@property (nonatomic, weak) IBOutlet UIImageView *commentImageView;
@property (nonatomic, weak) IBOutlet UIImageView *shareImageView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *timeLabel;
@property (nonatomic, weak) IBOutlet UILabel *locationLabel;
@property (nonatomic, weak) IBOutlet UILabel *commentLabel;
@property (nonatomic, weak) IBOutlet UILabel *numberLikeLabel;
@property (nonatomic, weak) IBOutlet UILabel *numberCommentLabel;
@property (nonatomic, weak) IBOutlet UILabel *numberShareLabel;

@end
