//
//  OMMTouchableView.h
//  TouchDraw
//
//  Created by Tyler Bindon on 12-04-15.
//  Copyright (c) 2012 Martica.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OMMColouredPath.h"

@interface OMMTouchableView : UIView

@property (strong,nonatomic) UIColor *currentColour;
@property (strong,nonatomic) NSMutableArray *colouredPaths;
@property (strong,nonatomic) UIBezierPath *currentPath;

- (IBAction)changeColour:(id)sender;

@end
