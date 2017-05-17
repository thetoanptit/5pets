//
//  FPConstant.h
//  FindPet
//
//  Created by tungnd on 3/20/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#ifndef FPConstant_h
#define FPConstant_h


#endif /* FPConstant_h */

#define FPBackgroundColor [UIColor colorWithRed:1.000 green:0.671 blue:0.031 alpha:1.000]
#define UIColorFromHex(rgbValue)                                                         \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0                 \
green:((float)((rgbValue & 0x00FF00) >> 8)) / 255.0                  \
blue:((float)((rgbValue & 0x0000FF) >> 0)) / 255.0                  \
alpha:1.0]
