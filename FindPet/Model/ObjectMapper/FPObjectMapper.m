//
//  FPObjectMapper.m
//  FindPet
//
//  Created by ifis on 5/24/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import "FPObjectMapper.h"

@implementation FPObjectMapper

+ (FPAccountModel *)mapperFromAccountDictionary:(NSDictionary *)accountDic {
    FPAccountModel *accountModel = [[FPAccountModel alloc] init];
    accountModel.email = accountDic[@"Email"];
    accountModel.avatar = accountDic[@"Avatar"];
    accountModel.password = accountDic[@"Password"];
    accountModel.addDate = accountDic[@"AddDate"];
    accountModel.loginLast = accountDic[@"LoginLast"];
    accountModel.changePassLast = accountDic[@"ChangePassLast"];
    accountModel.fullName = accountDic[@"FullName"];
    accountModel.phone = accountDic[@"Phone"];
    accountModel.address = accountDic[@"Address"];
    accountModel.birthday = accountDic[@"BirthDay"];
    accountModel.sex = accountDic[@"Sex"];
    accountModel.city = accountDic[@"City"];
    accountModel.distric = accountDic[@"Distric"];
    accountModel.fbID = accountDic[@"fbID"];
    accountModel.ssID = accountDic[@"ssID"];
    accountModel.latitude = [accountDic[@"Latitude"] floatValue];
    accountModel.longtitude = [accountDic[@"Longtitude"] floatValue];
    accountModel.distant = [accountDic[@"Distant"] floatValue];
    accountModel.fcm_token = accountDic[@"fcm_token"];

    return accountModel;
}


@end
