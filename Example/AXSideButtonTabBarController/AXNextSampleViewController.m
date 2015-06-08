//
//  AXNextSampleViewController.m
//  AXSideButtonTabBarController
//

#import "AXNextSampleViewController.h"
#import "AXHidesTabSampleViewController.h"

@interface AXNextSampleViewController ()

@end

@implementation AXNextSampleViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.title = @"NextSample";
  
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)goToNext:(id)sender
{
  AXHidesTabSampleViewController *hidesTabSampleViewCon = [[AXHidesTabSampleViewController alloc] init];
  [self.navigationController pushViewController:hidesTabSampleViewCon
                                       animated:YES];
}

@end
