//
//  AXHidesTabSampleViewController.m
//  AXSideButtonTabBarController
//

#import "AXHidesTabSampleViewController.h"
#import <AXSideButtonTabBarController/AXSideButtonTabBarController.h>
#import "AXNextSampleViewController.h"

@interface AXHidesTabSampleViewController ()

@end

@implementation AXHidesTabSampleViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.title = @"HidesTabSample";
  self.view.backgroundColor = [UIColor whiteColor];
  
  UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeSystem];
  [nextButton setTitle:@"Next" forState:UIControlStateNormal];
  [nextButton sizeToFit];
  [nextButton setCenter:(CGPoint){
    CGRectGetMidX(self.view.bounds),
    CGRectGetMidY(self.view.bounds),
  }];
  [nextButton addTarget:self action:@selector(goToNext:)
       forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:nextButton];
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  [self.tabBarController.tabBar setHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
  [self.tabBarController.tabBar setHidden:NO];
  [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)goToNext:(id)sender
{
  AXNextSampleViewController *nextViewCon = [[AXNextSampleViewController alloc] init];
  [self.navigationController pushViewController:nextViewCon
                                       animated:YES];
}

@end
