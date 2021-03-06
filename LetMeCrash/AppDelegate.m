//
//  AppDelegate.m
//  LetMeCrash
//
//  Created by Hokila on 2013/10/24.
//  Copyright (c) 2013年 Hokila. All rights reserved.
//

#import "AppDelegate.h"
#import "Flurry.h"
#import "UncaughtExceptionHandler.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //catch exception
    InstallUncaughtExceptionHandler();
    
    [self checkCrashStatus];
    //Flurry 
    [Flurry startSession:@"JJMGZNWGMJ49SFDG35VP"];
    [Flurry setCrashReportingEnabled:YES];
    
    // Override point for customization after application launch.
    return YES;
}

-(void)checkCrashStatus{
    BOOL isJustCrash = [[NSUserDefaults standardUserDefaults] boolForKey:@"CrashStatus"];
    
    if (isJustCrash) {
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:NSLocalizedString(@"我們發現app崩潰了", nil)
                                                message:NSLocalizedString(@"願意協助改善xxx嗎？", nil)
                                                delegate:self
                                                cancelButtonTitle:NSLocalizedString(@"願意", nil)
                                                otherButtonTitles: NSLocalizedString(@"不願意", nil),nil];
        [alert show];
    }
    
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"CrashStatus"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
