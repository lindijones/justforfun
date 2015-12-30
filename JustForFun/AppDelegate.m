//
//  AppDelegate.m
//  JustForFun
//
//  Created by Linder, Thomas L. (415) on 26.11.15.
//  Copyright © 2015 Linder, Thomas L. (415). All rights reserved.
//

#import "AppDelegate.h"
//#import "ViewController.h"
//#import "JFFTableViewController.h"
//#import "JFFScrollViewController.h"
#import "JFFRootViewController.h"

@interface AppDelegate ()
@property (nonatomic, strong) UINavigationController *navController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // show one of the different VCs
    //UIViewController *vc = [[ViewController alloc] init];
    
    //JFFTableViewController *tableVC = [[JFFTableViewController alloc] init];
    
    //JFFScrollViewController *scrollVC = [[JFFScrollViewController alloc] init];
    
    JFFRootViewController *rootVC = [[JFFRootViewController alloc] init];
    
    self.navController = [[UINavigationController alloc] initWithRootViewController:rootVC];
    // set the bar translucence to NO
    self.navController.navigationBar.translucent = YES; // reset the frames for the child VC ;-) => Content is not under the nav bar
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = self.navController;
    [self.window makeKeyAndVisible];
    return YES;

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
