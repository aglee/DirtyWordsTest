//
//  DWApplication.m
//  DirtyWordsTest
//
//  Created by Andy Lee on 5/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DWApplication.h"
#import "DirtyWordsTestAppDelegate.h"

@implementation DWApplication

- (void)sendEvent:(NSEvent *)anEvent
{
	if ([anEvent type] == NSKeyDown)
	{
		// Clear the keyboard action description field on the assumption that
		// this event will not generate a keyboard action. If it turns out that
		// it does, we will update the description field at that time.
		[(DirtyWordsTestAppDelegate *)[self delegate] clearKeyboardActionDescription];
	}
	
	[super sendEvent:anEvent];
}

@end
