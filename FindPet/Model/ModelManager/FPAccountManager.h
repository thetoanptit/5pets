//
//  FPAccountManager.h
//  FindPet
//
//  Created by ifis on 5/19/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FPAccountModel.h"

@interface FPAccountManager : NSObject
+ (void)insertAccountWithFPAccountModel:(FPAccountModel *) accountModel;
+ (FPAccountModel *) getAccountModel;
+ (void) removeAccountModel;
@end
