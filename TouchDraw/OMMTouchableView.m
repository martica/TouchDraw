//
//  OMMTouchableView.m
//  TouchDraw
//
//  Created by Tyler Bindon on 12-04-15.
//  Copyright (c) 2012 Martica.org. All rights reserved.
//

#import "OMMTouchableView.h"

@implementation OMMTouchableView

@synthesize currentPath = _currentPath;
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
        [colouredPath.colour setStroke];
        [colouredPath.path stroke];
    }
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
    self.currentPath=[[UIBezierPath alloc]init];
    self.currentPath.lineWidth=10;
    UITouch *touch= [touches anyObject];
    [self.currentPath moveToPoint:[touch locationInView:self]];
    
    OMMColouredPath *newColouredPath = [[OMMColouredPath alloc] init];
    [newColouredPath setColour:self.currentColour];
    [newColouredPath setPath:self.currentPath];
    [self.colouredPaths addObject:newColouredPath];

    
//    if ([touch tapCount] == 2) {
//        [self eraseButtonClicked];
//        return;
//    }
//    
//    lastPoint = [touch locationInView:self];
//    lastPoint.y -= 20;
    
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //swiped = YES;
    
    UITouch *touch = [touches anyObject];   
//    CGPoint currentPoint = [touch locationInView:self];
//    currentPoint.y -= 20;
    
    [self.currentPath addLineToPoint:[touch locationInView:self]];
    [self setNeedsDisplay];
    
//    UIGraphicsBeginImageContext(self.frame.size);
//    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
//    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 15.0);
//    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, 1.0);
//    CGContextBeginPath(UIGraphicsGetCurrentContext());
//    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
//    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
//    CGContextStrokePath(UIGraphicsGetCurrentContext());
//    UIGraphicsEndImageContext();
    
//    lastPoint = currentPoint;
    
//    moved++;    
//    if (moved == 10) {
//        moved = 0;
//    }
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
//    UITouch *touch = [touches anyObject];   
//    if ([touch tapCount] == 2) {
//        [self eraseButtonClicked];
//        return;
//    }
    self.currentPath = nil;
}

@end
