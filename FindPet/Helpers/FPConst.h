//
//  FPConst.h
//  FindPet
//
//  Created by ifis on 5/17/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FPConst : NSObject
typedef NS_ENUM(NSInteger, FPCellProfileInformation) {
    FPCellProfileInformationSpecies = 0,
    FPCellProfileInformationBred,
    FPCellProfileInformationParents,
    FPCellProfileInformationGender,
    FPCellProfileInformationBirth,
    FPCellProfileInformationCoatColor,
    FPCellProfileInformationVaccination
};

@end
