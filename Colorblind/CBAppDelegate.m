//
//  AppDelegate.m
//  Colorblind
//
//  Created by Tim Wood on 4/7/14.
//  Copyright (c) 2014 Tim Wood. All rights reserved.
//

#import "CBAppDelegate.h"
#import "CBViewController.h"

@implementation CBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [UIApplication sharedApplication].statusBarHidden = YES;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [[CBViewController alloc] init];
    
    return YES;
}

@end
