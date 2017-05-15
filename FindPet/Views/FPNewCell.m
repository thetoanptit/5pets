//
//  FPNewCell.m
//  FindPet
//
//  Created by tungnd on 3/20/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import <FontAwesomeKit/FontAwesomeKit.h>

#import "FPNewCell.h"
#import "FPConstant.h"

@implementation FPNewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    CGSize iconsize = CGSizeMake(10, 10);
    
    FAKIonIcons *icon = [FAKIonIcons iosHeartOutlineIconWithSize:10];
    [icon setAttributes:@{NSForegroundColorAttributeName:FPBackgroundColor}];
    self.likeImageView.image = [icon imageWithSize:iconsize];
    
    icon = [FAKIonIcons iosComposeOutlineIconWithSize:10];
    [icon setAttributes:@{NSForegroundColorAttributeName:FPBackgroundColor}];
    self.commentImageView.image = [icon imageWithSize:iconsize];
    
    icon = [FAKIonIcons androidShareIconWithSize:10];
    [icon setAttributes:@{NSForegroundColorAttributeName:FPBackgroundColor}];
    self.shareImageView.image = [icon imageWithSize:iconsize];
    
    self.avataImageView.layer.cornerRadius = 25;
    self.avataImageView.layer.borderWidth = 1;
    self.avataImageView.layer.borderColor = FPBackgroundColor.CGColor;
    self.avataImageView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
