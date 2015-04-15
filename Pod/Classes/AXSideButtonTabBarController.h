//
//  AXSideButtonTabBarController.h
//  Pods
//

#import <UIKit/UIKit.h>
#import "AXSideButton.h"

@interface AXSideButtonTabBarController : UITabBarController
@property (readonly, nonatomic)  UITabBar *backgroundTabBar;
@property (strong, nonatomic) UIView<AXSideButton> *leftButton;
@property (strong, nonatomic) UIView<AXSideButton> *rightButton;
@property (nonatomic) BOOL showSeparatorInTabBar;
@end
