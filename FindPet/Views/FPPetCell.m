//
//  FPPetCell.m
//  FindPet
//
//  Created by tungnd on 3/21/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import <FontAwesomeKit/FontAwesomeKit.h>

#import "FPPetCell.h"
#import "FPConstant.h"

@implementation FPPetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.pictureImage.layer.borderColor = FPBackgroundColor.CGColor;
    FAKIonIcons *icon = [FAKIonIcons iosLocationIconWithSize:25];
    [icon setAttributes:@{NSForegroundColorAttributeName:FPBackgroundColor}];
    self.locationImage.image = [icon imageWithSize:CGSizeMake(25, 25)];
    
    icon = [FAKIonIcons iosPawIconWithSize:25];
    [icon setAttributes:@{NSForegroundColorAttributeName:FPBackgroundColor}];
    self.pawImage.image = [icon imageWithSize:CGSizeMake(25, 25)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
