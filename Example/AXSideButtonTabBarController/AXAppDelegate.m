//
//  AXAppDelegate.m
//  AXSideButtonTabBarController
//

#import "AXAppDelegate.h"
#import <AXSideButtonTabBarController/AXSideButtonTabBarController.h>
#import <FontAwesomeKit/FontAwesomeKit.h>

@implementation AXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  // Sample dummy view controllers;
  UIViewController *dummy0 = [[UIViewController alloc] init];
  dummy0.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostViewed tag:0];
  dummy0.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
  UIViewController *dummy1 = [[UIViewController alloc] init];
  dummy1.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:1];
  dummy1.view.backgroundColor = [UIColor greenColor];
  UIViewController *dummy2 = [[UIViewController alloc] init];
  dummy2.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:2];
  dummy2.view.backgroundColor = [UIColor cyanColor];
  
  // Dummy Resources
  const CGFloat kIconSize = 52.0;
  UIImage *sideMenuIcon = [[[FAKFontAwesome barsIconWithSize:kIconSize] imageWithSize:(CGSize){kIconSize, kIconSize}] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
  UIImage *friendsMenuIcon = [[[FAKFontAwesome usersIconWithSize:52.0] imageWithSize:(CGSize){52.0, 52.0}] imageWithRenderingMode: UIImageRenderingModeAlwaysTemplate];
  UIColor *buttonTintColor = [UIColor colorWithWhite:0.1 alpha:0.8];
  
  // Create tab bar controller
  AXSideButtonTabBarController *tabBarController = [[AXSideButtonTabBarController alloc] init];
  tabBarController.leftButton = [[AXSideButton alloc] initWithImage:sideMenuIcon
                                                             target:self action:@selector(showSideMenu:)];
  tabBarController.leftButton.tintColor = buttonTintColor;
  tabBarController.rightButton = [[AXSideButton alloc] initWithTitle:@"Friends"
                                                               image:friendsMenuIcon
                                                              target:self action:@selector(showSideMenu:)];
  tabBarController.rightButton.tintColor = buttonTintColor;

  tabBarController.viewControllers = @[dummy0, dummy1, dummy2];
  tabBarController.showSeparatorInTabBar = YES;
  
  UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  window.rootViewController = tabBarController;
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

#pragma mark - Private method

- (void)showSideMenu:(id)sender
{
  [[[UIAlertView alloc] initWithTitle:nil message:@"called showSideMenu:" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}

- (void)showFriendList:(id)sender
{
  
}

@end
