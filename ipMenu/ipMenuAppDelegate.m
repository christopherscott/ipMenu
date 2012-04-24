//
//  ipMenuAppDelegate.m
//  ipMenu
//
//  Created by Christopher Scott Hernandez on 10/9/11.
//  Copyright 2011 Christopher Scott Hernandez. All rights reserved.
//

#import "ipMenuAppDelegate.h"

@implementation ipMenuAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    ipStatusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength: NSVariableStatusItemLength] retain];
    
    [self refreshIps];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:5
                                                      target:self selector:@selector(refreshIps)
                                                    userInfo:NULL repeats:YES];
    repeatingTimer = timer;
    
}

- (IBAction)copyIPtoClipboard:(id)sender
{
    NSPasteboard *pboard = [NSPasteboard generalPasteboard];
    [pboard clearContents];
    [pboard writeObjects: [NSArray arrayWithObject: [sender title]]];
}

- (IBAction)openNetworkPreferences:(id)sender
{
    [[NSWorkspace sharedWorkspace] openFile: @"/System/Library/PreferencePanes/Network.prefPane"];
}

- (void) refreshIps
{    
    int i;
    NSUInteger len;
    NSArray *ipAddresses = [[NSHost currentHost] addresses];
    
    // set the status item title to the ipv4, item[1] in the ipAddresses array
    [ipStatusItem setTitle:[ipAddresses objectAtIndex:1]];
    [ipStatusItem setHighlightMode:YES];
    [ipStatusItem setMenu:ipStatusItemMenu];
    
    // set titles of menu items to be the ipaddresses themselves
    for (i=0,len=[ipAddresses count]; i<len; i++) {
        [[ipStatusItemMenu itemAtIndex:i] setTitle: [ipAddresses objectAtIndex:i]];
    }
    
}

- (void) dealloc
{
    [ipStatusItem release];
    [repeatingTimer release];
    [super dealloc];
}

@end
