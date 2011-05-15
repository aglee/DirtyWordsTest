# DirtyWordsTest

Andy Lee, <mailto:aglee@earthlink.net>

At the May 2011 meeting of [CocoaHeads NYC](http://cocoaheads.org/us/NewYorkNewYork/index.html), I gave a talk based on "[The Top Ten Cocoa Words That Sound Dirty But Aren't](http://www.notesfromandy.com/2011/05/14/ten-cocoa-words-plus-two/)".

This is a small app I wrote to go along with that talk. It demonstrates four of the ten words: insertBacktab:, yank:, stroke, and toolTip.

## insertBacktab: and yank:

By editing text in the "Keyboard Actions" window, you can see what keyboard action methods are invoked in response to various keystrokes. For example, Shift-Tab maps to insertBacktab:, and Control-Y maps to yank:.

Since giving the talk, I've learned that a keystroke can trigger not only one keyboard action message but a *sequence* of them. For example, Control-O triggers insertNewlineIgnoringFieldEditor: followed by moveBackward:. I updated the app to reflect this.

The following Apple docs explain how keyboard actions work:

* [Handling Key Events](http://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/EventOverview/HandlingKeyEvents/HandlingKeyEvents.html) -- High-level overview. Note this paragraph from the section "Handling Keyboard Actions and Inserting Text":

    > Responder objects that deal with text, such as text views, have to be prepared to handle key events that can either be characters to insert or keyboard actions. As noted in “The Path of Key Events,” keyboard actions are a special kind of action message that depends on the key bindings mechanism, which binds specific keystrokes (for example, Control-e) to specific commands related to the text (for example, move the insertion point to the end of the current line). These commands are implemented in methods defined by NSResponder to give per-view functional interpretations of those physical keystrokes.

* [The Path of Key Events](http://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/EventOverview/EventArchitecture/EventArchitecture.html%23//apple_ref/doc/uid/10000060i-CH3-SW10) -- Linked to from the paragraph quoted above; uses a flowchart to show how key events are dispatched.

* [Text System Defaults and Key Bindings](http://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/EventOverview/TextDefaultsBindings/TextDefaultsBindings.html%23//apple_ref/doc/uid/20000468-CJBDEADF) -- Describes the contents of key-bindings dictionary files, where they live, and how to edit them. There's a way to use plain text to specify physical keys that don't correspond to printable characters.

See also:

* [Customizing the Cocoa Text System ](http://www.hcs.harvard.edu/~jrus/Site/Cocoa%20Text%20System.html) by Jacob Rus.
* [KeyBindingsEditor](http://www.cocoabits.com/KeyBindingsEditor/), which I mentioned in my talk, and which Jacob also links to. This is handy for reading StandardKeyBindings.dict, which contains non-printing characters. You shouldn't edit that file, but you might like to browse it, or edit a copy.

## stroke

The "FrameRect() vs. -stroke" window illustrates the fact that -[NSBezierPath stroke] draws a line that straddles the points on the Bezier curve. This is compared to NSFrameRectWithWidth(), which draws its line just inside the given coordinates.

## toolTip

I hadn't realized that menu items could have tool tips. To prove it to myself, I gave the Quit menu item a tool tip. Not really very instructive, just something I didn't know you could do.
