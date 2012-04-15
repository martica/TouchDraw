//
//  OMMAppDelegate.h
//  TouchDraw
//
//  Created by Tyler Bindon on 12-04-15.
//  Copyright (c) 2012 Martica.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OMMViewController;

@interface OMMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) OMMViewController *viewController;

@end
