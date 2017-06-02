//
//  FPProfileSingleTableViewCell.m
//  FindPet
//
//  Created by ifis on 5/17/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import "FPProfileSingleTableViewCell.h"

@implementation FPProfileSingleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    if (selected) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Nhập thông tin:" message:@"Vui lòng điền thêm thông tin" preferredStyle:UIAlertControllerStyleAlert];
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = self.lblTitle.text;
        }];

        UIAlertAction *buttonCancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:buttonCancel];
        
        UIAlertAction *buttonOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.lblDetail.text = [alert.textFields objectAtIndex:0].text;
        }];
        [alert addAction:buttonOK];
        
        [self.window.rootViewController showViewController:alert sender:nil];
        
    }
}

@end
