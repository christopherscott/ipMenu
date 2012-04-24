//
//  ipMenuAppDelegate.h
//  ipMenu
//
//  Created by Christopher Hernandez on 10/9/11.
//  Copyright 2011 Christopher Scott Hernandez. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ipMenuAppDelegate : NSObject <NSApplicationDelegate> {
    
    NSWindow *window;
    NSStatusItem *ipStatusItem;
    IBOutlet NSMenu *ipStatusItemMenu;
    IBOutlet NSTabView *ipTabMenu;
    
    NSTimer *repeatingTimer;
    
}

@property (assign) IBOutlet NSWindow *window;

- (IBAction)copyIPtoClipboard:(id)sender;
- (IBAction)openNetworkPreferences:(id)sender;
- (void)refreshIps;

@end
