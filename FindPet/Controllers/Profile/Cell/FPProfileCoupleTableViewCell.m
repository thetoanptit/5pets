//
//  FPProfileCoupleTableViewCell.m
//  FindPet
//
//  Created by ifis on 5/17/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import "FPProfileCoupleTableViewCell.h"

@implementation FPProfileCoupleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    if (selected) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Nhập thông tin:" message:@"Vui lòng điền thêm thông tin" preferredStyle:UIAlertControllerStyleAlert];
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = self.lblTitle1.text;
        }];
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = self.lblTitle2.text;
        }];
        UIAlertAction *buttonCancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:buttonCancel];
        
        UIAlertAction *buttonOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.lblDetail1.text = [alert.textFields objectAtIndex:0].text;
            self.lblDetail2.text = [alert.textFields objectAtIndex:1].text;
        }];
        [alert addAction:buttonOK];
        
        [self.window.rootViewController showViewController:alert sender:nil];

    }
}

@end
