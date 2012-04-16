//
//  OMMTouchableView.m
//  TouchDraw
//
//  Created by Tyler Bindon on 12-04-15.
//  Copyright (c) 2012 Martica.org. All rights reserved.
//

#import "OMMTouchableView.h"

@implementation OMMTouchableView

@synthesize currentColouredPath = _currentColouredPath;
@synthesize currentColour = _currentColour;
@synthesize colouredPaths = _colouredPaths;

- (id)initWithFrame:(CGRect)frame
{
    if (!(self = [super initWithFrame:frame]))
        return nil;
    
    [self initializeView];
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (!(self = [super initWithCoder:aDecoder])) 
        return nil;
    
    [self initializeView];
    
    return self;
}

- (void)initializeView {
    _currentColour = [UIColor redColor];
    _colouredPaths = [NSMutableArray array];
    [self setUserInteractionEnabled:YES];
}

- (void)drawRect:(CGRect)rect {
    for (OMMColouredPath *colouredPath in self.colouredPaths) {
        [colouredPath draw];
    }
}

#pragma mark - Actions

- (void)eraseButtonClicked {
    [self.colouredPaths removeAllObjects];
    [self setNeedsDisplay];
}

- (void)undoStroke:(id)sender {
    [self.colouredPaths removeLastObject];
    [self setNeedsDisplay];
}

- (void)changeColour:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    NSInteger selectedSegment = [segmentedControl selectedSegmentIndex];
    if (selectedSegment == 0) {
        self.currentColour = [UIColor redColor];
    } else {
        self.currentColour = [UIColor greenColor];
    }
}

#pragma mark - Touch Methods
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{   
    self.currentColouredPath = [[OMMColouredPath alloc] init];
    [self.currentColouredPath setColour:self.currentColour];

    UITouch *touch= [touches anyObject];
    [self.currentColouredPath.path moveToPoint:[touch locationInView:self]];
    [self.colouredPaths addObject:self.currentColouredPath];

    
    if ([touch tapCount] == 2) {
        [self eraseButtonClicked];
        return;
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];   
    [self.currentColouredPath.path addLineToPoint:[touch locationInView:self]];
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.currentColouredPath = nil;
}

@end
