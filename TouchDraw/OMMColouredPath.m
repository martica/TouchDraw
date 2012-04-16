//
//  OMMColouredPath.m
//  TouchDraw
//
//  Created by Tyler Bindon on 12-04-15.
//  Copyright (c) 2012 Martica.org. All rights reserved.
//

#import "OMMColouredPath.h"

@implementation OMMColouredPath

@synthesize path = _path;
@synthesize colour = _colour;

- (id)init {
    if (!(self = [super init] ))
        return nil;
    
    _path = [[UIBezierPath alloc] init];
    [_path setLineWidth:10];

    _colour = [UIColor blackColor];
        
    return self;
}

- (void)draw {
    [self.colour setStroke];
    [self.path stroke];
}

@end
