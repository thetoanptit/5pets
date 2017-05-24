//
//  FPObjectMapper.h
//  FindPet
//
//  Created by ifis on 5/24/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FPAccountModel.h"

@interface FPObjectMapper : NSObject
+(FPAccountModel *)mapperFromAccountDictionary:(NSDictionary *)accountDic;

@end
