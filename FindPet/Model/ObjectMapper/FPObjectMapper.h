//
//  FPObjectMapper.h
//  FindPet
//
//  Created by ifis on 5/25/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FPAccountModel.h"

@interface FPObjectMapper : NSObject

+ (FPAccountModel *)mappingAccountModelFromAccountDic:(NSDictionary *) accountDic;

@end
