//
//  DWRectsView.m
//  DirtyWordsTest
//
//  Created by Andy Lee on 5/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DWRectsView.h"

@implementation DWRectsView

- (void)drawRect:(NSRect)dirtyRect
{
	NSRect bounds = [self bounds];
	
	// Draw a black background.
	[[NSColor blackColor] set];
	NSRectFill([self bounds]);
	
	// Calculate the left and right rects based on [self bounds].
	NSRect leftRect;
	NSRect rightRect;
	CGFloat insetAmount = 24;
	
	NSDivideRect(bounds, &leftRect, &rightRect, NSWidth(bounds) / 2, NSMinXEdge);
	
	leftRect = NSIntegralRect(NSInsetRect(leftRect, insetAmount, insetAmount));
	rightRect = NSIntegralRect(NSInsetRect(rightRect, insetAmount, insetAmount));
	
	// Set some common drawing parameters.
	CGFloat thickLineWidth = 14;
	CGFloat thinLineWidth = 1;
	NSColor *thickLineColor = [NSColor redColor];
	NSColor *thinLineColor = [NSColor yellowColor];
	
	// Frame the left rectangle using NSFrameRectWithWidth().
	[thickLineColor set];
	NSFrameRectWithWidth(leftRect, thickLineWidth);
	
	[thinLineColor set];
	NSFrameRectWithWidth(leftRect, thinLineWidth);
	
	// Stroke the right rectangle using [NSBezierPath stroke].
	NSBezierPath *rectPath = [NSBezierPath bezierPathWithRect:rightRect];
	
	[thickLineColor set];
	[rectPath setLineWidth:thickLineWidth];
	[rectPath stroke];
	
	[rectPath setLineWidth:thinLineWidth];
	[thinLineColor set];
	[rectPath stroke];
}

@end
