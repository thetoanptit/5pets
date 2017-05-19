//
//  FPAccountManager.m
//  FindPet
//
//  Created by ifis on 5/19/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import "FPAccountManager.h"
#import "Logging.h"

@implementation FPAccountManager
+ (void)insertAccountWithFPAccountModel:(FPAccountModel *)accountModel {
    [FPAccountManager removeAccountModel];
    LogTrace(@"Number of account:%i", (int)[FPAccountModel allObjects].count);
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm beginWriteTransaction];
    
    FPAccountModel *account = [[FPAccountModel alloc] init];
    
    account.email = accountModel.email;
    account.avatar = accountModel.avatar;
    account.password = accountModel.password;
    account.addDate = accountModel.addDate;
    account.loginLast = accountModel.loginLast;
    account.changePassLast = accountModel.changePassLast;
    account.fullName = accountModel.fullName;
    account.phone = accountModel.phone;
    account.address = accountModel.address;
    account.birthday = accountModel.birthday;
    account.sex = accountModel.sex;
    account.city = accountModel.city;
    account.distric = accountModel.distric;
    account.fbID = accountModel.fbID;
    account.ssID = accountModel.ssID;
    account.latitude = accountModel.latitude;
    account.longtitude = accountModel.longtitude;
    account.distant = accountModel.distant;
    account.fcm_token = accountModel.fcm_token;
    
    [realm addObject:account];
    [realm commitWriteTransaction];
}

+ (FPAccountModel *)getAccountModel {
    return [[FPAccountModel allObjects] firstObject];
}

+ (void)removeAccountModel {
    [[RLMRealm defaultRealm] beginWriteTransaction];
    [[RLMRealm defaultRealm] deleteAllObjects];
    [[RLMRealm defaultRealm] commitWriteTransaction];
}

@end
