//
//  DWApplication.h
//  DirtyWordsTest
//
//  Created by Andy Lee on 5/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/*!
 * Overrides sendEvent: so that key-down events clear the keyboard action
 * description field in the app window.
 */
@interface DWApplication : NSApplication
{
}

@end
