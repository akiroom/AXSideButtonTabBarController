//
//  AXAppDelegate.h
//  AXSideButtonTabBarController
//

#import <UIKit/UIKit.h>
#import <AXSideButtonTabBarController/AXSideButtonTabBarController.h>

@interface AXAppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
- (void)showSideMenu:(id)sender;
- (void)showFriendList:(id)sender;
- (AXSideButton *)generateLeftSideMenuButton;
- (AXSideButton *)generateRightFriendsButton;
@end
