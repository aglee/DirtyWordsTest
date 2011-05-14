//
//  DWTextView.m
//  DirtyWordsTest
//
//  Created by Andy Lee on 5/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DWTextView.h"
#import "DirtyWordsTestAppDelegate.h"

@implementation DWTextView

- (void)doCommandBySelector:(SEL)aSelector
{
	[(DirtyWordsTestAppDelegate *)[NSApp delegate] updateKeyboardActionDescriptionWithSelector:aSelector];
	[super doCommandBySelector:aSelector];
}

@end
