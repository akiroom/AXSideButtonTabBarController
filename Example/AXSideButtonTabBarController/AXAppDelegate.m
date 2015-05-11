//
//  AXAppDelegate.m
//  AXSideButtonTabBarController
//

#import "AXAppDelegate.h"
#import <FontAwesomeKit/FontAwesomeKit.h>
#import "AXNextSampleViewController.h"
#import "AXSettingsViewController.h"

static const CGFloat kIconSize = 26.0;

@implementation AXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  // Sample dummy view controllers;
  AXNextSampleViewController *dummy0 = [[AXNextSampleViewController alloc] init];
  dummy0.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostViewed tag:0];
  dummy0.view.backgroundColor = [UIColor whiteColor];
  UIViewController *dummy1 = [[UIViewController alloc] init];
  dummy1.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:1];
  dummy1.view.backgroundColor = [UIColor whiteColor];
  AXSettingsViewController *dummy2 = [[AXSettingsViewController alloc] init];
  dummy2.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:2];
  
  // Create tab bar controller
  AXSideButtonTabBarController *tabBarController = [[AXSideButtonTabBarController alloc] init];
  tabBarController.leftButton = [self generateLeftSideMenuButton];
  tabBarController.rightButton = [self generateRightFriendsButton];
  
  tabBarController.viewControllers =
  @[
    [[UINavigationController alloc] initWithRootViewController:dummy0],
    dummy1,
    dummy2
    ];
  tabBarController.separatorInTabBar = AXSideButtonTabBarControllerSeparatorAll;
  
  UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  window.rootViewController = tabBarController;
  [window makeKeyAndVisible];
  self.window = window;
  return YES;
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

#pragma mark - Action

- (void)showSideMenu:(id)sender
{
  [[[UIAlertView alloc] initWithTitle:nil message:@"called showSideMenu:" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}

- (void)showFriendList:(id)sender
{
  
}

#pragma mark - Dummy button creator

- (AXSideButton *)generateLeftSideMenuButton
{
  UIImage *icon = [[[FAKFontAwesome barsIconWithSize:kIconSize] imageWithSize:(CGSize){kIconSize, kIconSize}] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
  
  AXSideButton *button = [[AXSideButton alloc] initWithImage:icon
                                                      target:self action:@selector(showSideMenu:)];
  return button;
}

- (AXSideButton *)generateRightFriendsButton
{
  UIImage *icon = [[[FAKFontAwesome usersIconWithSize:kIconSize] imageWithSize:(CGSize){kIconSize, kIconSize}] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
  UIColor *buttonTintColor = [UIColor colorWithWhite:0.1 alpha:0.8];
  
  AXSideButton *button = [[AXSideButton alloc] initWithTitle:@"Friends"
                                                       image:icon
                                                      target:self action:@selector(showSideMenu:)];
  return button;
}

@end
