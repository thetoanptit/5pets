//
//  FPAccountModel.h
//  FindPet
//
//  Created by ifis on 5/15/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm.h>

@interface FPAccountModel : RLMObject
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *addDate;
@property (nonatomic, strong) NSString *loginLast;
@property (nonatomic, strong) NSString *changePassLast;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *birthday;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *distric;
@property (nonatomic, strong) NSString *fbID;
@property (nonatomic) float latitude;
@property (nonatomic) float longtitude;
@property (nonatomic) float distant;
@property (nonatomic, strong) NSString *fcm_token;
@end
