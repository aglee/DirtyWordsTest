//
//  DirtyWordsTestAppDelegate.h
//  DirtyWordsTest
//
//  Created by Andy Lee on 5/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DirtyWordsTestAppDelegate : NSObject <NSApplicationDelegate, NSWindowDelegate>
{
	// The event that most recently triggered a keyboard action.
	NSEvent *_lastKeyboardActionEvent;
	
	// Outlets.
	NSTextView *_textView;
	NSMatrix *_rectsViewLabelsMatrix;
	NSTextField *_keyboardActionDescriptionField;
}

@property (assign) IBOutlet NSTextView *textView;
@property (assign) IBOutlet NSMatrix *rectsViewLabelsMatrix;
@property (assign) IBOutlet NSTextField *keyboardActionDescriptionField;

- (void)clearKeyboardActionDescription;
- (void)updateKeyboardActionDescriptionWithSelector:(SEL)theSelector;

@end
