//
//  FPLeftMenuController.h
//  FindPet
//
//  Created by tungnd on 3/20/17.
//  Copyright © 2017 tungnd. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FPLeftMenuControllerDelegate <NSObject>

- (void) showMyPetsController;

@end

@interface FPLeftMenuController : UIViewController
@property (nonatomic, weak) id<FPLeftMenuControllerDelegate> delegate;
@end
