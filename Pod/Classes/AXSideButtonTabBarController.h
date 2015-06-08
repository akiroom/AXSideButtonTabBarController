//
//  AXSideButtonTabBarController.h
//  Pods
//

#import <UIKit/UIKit.h>
#import "AXSideButton.h"

typedef NS_ENUM(NSInteger, AXSideButtonTabBarControllerSeparatorMode) {
  AXSideButtonTabBarControllerSeparatorNone = 0,
  AXSideButtonTabBarControllerSeparatorSideButtonOnly,
  AXSideButtonTabBarControllerSeparatorAll,
};

@interface AXSideButtonTabBarController : UITabBarController
@property (readonly, nonatomic)  UITabBar *backgroundTabBar;
@property (strong, nonatomic) UIView<AXSideButton> *leftButton;
@property (strong, nonatomic) UIView<AXSideButton> *rightButton;
@property (nonatomic) AXSideButtonTabBarControllerSeparatorMode separatorInTabBar;
@end
