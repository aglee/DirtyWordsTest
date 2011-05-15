//
//  DirtyWordsTestAppDelegate.m
//  DirtyWordsTest
//
//  Created by Andy Lee on 5/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DirtyWordsTestAppDelegate.h"
#import "SRCommon.h"

@implementation DirtyWordsTestAppDelegate

@synthesize textView = _textView;
@synthesize rectsViewLabelsMatrix = _rectsViewLabelsMatrix;
@synthesize keyboardActionDescriptionField = _keyboardActionDescriptionField;

- (void)dealloc
{
	[_lastKeyboardActionEvent release];
	
	[super dealloc];
}

- (void)awakeFromNib
{
	[self clearKeyboardActionDescription];
	
	// IB flaw, at least in 3.2.4: can't set this.
	[_rectsViewLabelsMatrix setAutosizesCells:YES];
	
	// Use a big font so people in the back of the room can see.
	// IB bug: doesn't work to set the font there.
	[_textView setFont:[NSFont fontWithName:@"Courier New" size:24]];
}

- (void)clearKeyboardActionDescription
{
	[_keyboardActionDescriptionField setStringValue:@""];
}

// A single key-down event can invoke a sequence of one or more keyboard action
// methods. We use _lastKeyboardActionEvent to tell whether theSelector is being
// called for the first time for the current event.
- (void)updateKeyboardActionDescriptionWithSelector:(SEL)theSelector
{
	NSAssert(([[NSApp currentEvent] type] == NSKeyDown), @"Expected ([[NSApp currentEvent] type] == NSKeyDown)");
	
	NSEvent *keyDownEvent = [NSApp currentEvent];
	NSString *keystrokeString = SRStringForCocoaModifierFlagsAndKeyCode([keyDownEvent modifierFlags], [keyDownEvent keyCode]);
	NSString *commandString = NSStringFromSelector(theSelector);
	
	if (keyDownEvent != _lastKeyboardActionEvent)
	{
		NSString *displayString = [NSString stringWithFormat:@"%@   %@", keystrokeString, commandString];
		
		[_keyboardActionDescriptionField setStringValue:displayString];
		
		[_lastKeyboardActionEvent release];
		_lastKeyboardActionEvent = [keyDownEvent retain];
	}
	else
	{
		NSString *displayString = [NSString stringWithFormat:@"%@, %@", [_keyboardActionDescriptionField stringValue], commandString];
		
		[_keyboardActionDescriptionField setStringValue:displayString];
	}
}

- (void)applicationDidFinishLaunching:(NSNotification *)notif
{
	// Make sure the window I want to demo first in my presentation will be
	// active when I launch the app.
	[[_textView window] makeKeyAndOrderFront:nil];
}

@end
