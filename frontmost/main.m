//
//  main.m
//  frontmost
//
//  Created by Chaim-Leib Halbert on 3/10/14.
//  Copyright (c) 2014 Vivalion Software. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <Appkit/AppKit.h>
#include <stdio.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSWorkspace* workspace            = [NSWorkspace sharedWorkspace];
        NSDictionary* currentAppInfo      = [workspace activeApplication];
        
        int pid = [[currentAppInfo objectForKey: @"NSApplicationProcessIdentifier"] intValue];
        NSString* path = [currentAppInfo objectForKey:@"NSApplicationPath"];
        NSString* name = [currentAppInfo objectForKey:@"NSApplicationName"];
        NSString* appString = [NSString stringWithFormat:@"%i:%@:%@", pid, name, path, nil];
        
        printf("%s\n", appString.UTF8String);
    }
    return 0;
}

// To watch for application switching:
// [[workspace notificationCenter] addObserver:watcher selector:@selector(foremostAppActivated:) name:NSWorkspaceDidActivateApplicationNotification object:nil];