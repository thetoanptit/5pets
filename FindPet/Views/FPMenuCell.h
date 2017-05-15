//
//  FPMenuCell.h
//  FindPet
//
//  Created by tungnd on 3/20/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const kFPMenuCellIdentifier = @"FPMenuCell";

@interface FPMenuCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *image;
@property (nonatomic, weak) IBOutlet UILabel *label;

@end
