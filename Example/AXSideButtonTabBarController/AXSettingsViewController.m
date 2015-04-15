//
//  AXSettingsViewController.m
//  AXSideButtonTabBarController
//

#import "AXSettingsViewController.h"
#import <AXSideButtonTabBarController/AXSideButtonTabBarController.h>
#import "AXAppDelegate.h"

@interface AXSettingsViewController ()

@end

@implementation AXSettingsViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)toggleShowLeftButton:(id)sender {
  AXSideButtonTabBarController *tabBarCon = (id)self.tabBarController;
  if ([(UISwitch *)sender isOn]) {
    tabBarCon.leftButton = [(AXAppDelegate *)[[UIApplication sharedApplication] delegate] generateLeftSideMenuButton];
  } else {
    tabBarCon.leftButton = nil;
  }
}

- (IBAction)toggleShowRightButton:(id)sender {
  AXSideButtonTabBarController *tabBarCon = (id)self.tabBarController;
  if ([(UISwitch *)sender isOn]) {
    tabBarCon.rightButton = [(AXAppDelegate *)[[UIApplication sharedApplication] delegate] generateRightFriendsButton];
  } else {
    tabBarCon.rightButton = nil;
  }
}

- (IBAction)toggleShowSeparator:(id)sender {
  AXSideButtonTabBarController *tabBarCon = (id)self.tabBarController;
  if ([(UISwitch *)sender isOn]) {
    tabBarCon.separatorInTabBar = AXSideButtonTabBarControllerSeparatorAll;
  } else {
    tabBarCon.separatorInTabBar = AXSideButtonTabBarControllerSeparatorSideButtonOnly;
  }
}

@end
