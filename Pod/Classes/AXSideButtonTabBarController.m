//
//  AXSideButtonTabBarController.m
//  Pods
//

#import "AXSideButtonTabBarController.h"

@interface AXSideButtonTabBarController ()

@end

@implementation AXSideButtonTabBarController {
  NSMutableArray *_separatorLayers;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
    _backgroundTabBar = [[UITabBar alloc] init];
    _separatorLayers = [NSMutableArray array];
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.tabBar.shadowImage = [[UIImage alloc] init];
  self.tabBar.backgroundImage = [[UIImage alloc] init];
  [self updateTabBarLayout];
}

- (void)viewDidLayoutSubviews
{
  [super viewDidLayoutSubviews];
  
  // MEMO: These codes in HERE is bad hack for UITabBarController.
  if (![self.view.subviews containsObject:_backgroundTabBar]) {
    [self.view insertSubview:_backgroundTabBar belowSubview:self.tabBar];
  }
  if (_leftButton && ![self.view.subviews containsObject:_leftButton]) {
    [self.view addSubview:_leftButton];
  }
  if (_rightButton && ![self.view.subviews containsObject:_rightButton]) {
    [self.view addSubview:_rightButton];
  }
}

#pragma mark - Property

- (void)setViewControllers:(NSArray *)viewControllers animated:(BOOL)animated
{
  [super setViewControllers:viewControllers animated:animated];
  [self updateTabBarLayout];
}

- (void)setLeftButton:(UIView<AXSideButton> *)leftButton
{
  if (_leftButton != leftButton) {
    if (_leftButton) {
      [_leftButton removeFromSuperview];
    }
    _leftButton = leftButton;
    if (self.isViewLoaded) {
      [self.view addSubview:_leftButton];
    }
    [self updateTabBarLayout];
  }
}

- (void)setRightButton:(UIView<AXSideButton> *)rightButton
{
  if (_rightButton != rightButton) {
    if (_rightButton) {
      [_rightButton removeFromSuperview];
    }
    _rightButton = rightButton;
    if (self.isViewLoaded) {
      [self.view addSubview:_rightButton];
    }
    [self updateTabBarLayout];
  }
}

- (void)setShowSeparatorInTabBar:(BOOL)showSeparatorInTabBar
{
  if (_showSeparatorInTabBar != showSeparatorInTabBar) {
    _showSeparatorInTabBar = showSeparatorInTabBar;
    [self updateSeparatorInTabBar];
  }
}

#pragma mark - Private method

- (void)updateTabBarLayout
{
  UITabBar *tabBar = self.tabBar;
  [tabBar sizeToFit];

  CGFloat tabBarY = CGRectGetMinY(tabBar.frame);
  CGFloat tabBarWidth = CGRectGetWidth(tabBar.frame);
  CGFloat tabBarHeight = CGRectGetHeight(tabBar.frame);

  _backgroundTabBar.frame = (CGRect){
    0.0, tabBarY,
    tabBarWidth, tabBarHeight
  };
  
  CGFloat leftButtonWidth = [self widthForSideButton:_leftButton];
  if (_leftButton) {
    _leftButton.frame = (CGRect){
      0.0, tabBarY,
      leftButtonWidth, tabBarHeight
    };
  }
  CGFloat rightButtonWidth = [self widthForSideButton:_rightButton];
  if (_rightButton) {
    _rightButton.frame = (CGRect){
      tabBarWidth - rightButtonWidth, tabBarY,
      rightButtonWidth, tabBarHeight
    };
  }
  
  CGFloat visibleTabBarWidth = tabBarWidth - leftButtonWidth - rightButtonWidth;
  
  tabBar.frame = (CGRect){
    0.0 + leftButtonWidth, tabBarY,
    visibleTabBarWidth, tabBarHeight
  };
  
  [self updateSeparatorInTabBar];
}

- (void)updateSeparatorInTabBar
{
  CGFloat tabBarHeight = CGRectGetHeight(self.tabBar.bounds);
  CGFloat tabBarY = CGRectGetMinY(self.tabBar.frame);
  
  [_separatorLayers enumerateObjectsUsingBlock:^(CALayer *layer, NSUInteger idx, BOOL *stop) {
    [layer removeFromSuperlayer];
  }];
  [_separatorLayers removeAllObjects];
  if (_showSeparatorInTabBar) {
    // pre calculation
    CGFloat leftButtonWidth = [self widthForSideButton:_leftButton];
    
    if (_leftButton) {
      [self generateSeparatorLayerAtPosition:(CGPoint){leftButtonWidth, tabBarY} height:tabBarHeight];
    }
    if (_rightButton) {
      [self generateSeparatorLayerAtPosition:(CGPoint){CGRectGetMaxX(self.tabBar.frame), tabBarY} height:tabBarHeight];
    }
    CGFloat positionX;
    CGFloat tabItemWidth = floor(CGRectGetWidth(self.tabBar.bounds) / self.viewControllers.count);
    for (NSInteger index = 1; index < self.viewControllers.count; index++) {
      positionX = leftButtonWidth + tabItemWidth * index;
      [self generateSeparatorLayerAtPosition:(CGPoint){positionX, tabBarY} height:tabBarHeight];
    };
  }
}

- (CGFloat)widthForSideButton:(UIView<AXSideButton> *)sideButton
{
  if (!sideButton) {
    return 0.0;
  } else if ([sideButton respondsToSelector:@selector(preferredWidth)]) {
    CGFloat width = sideButton.preferredWidth;
    if (width > 0.0) {
      return _rightButton.preferredWidth;
    }
  }
  return CGRectGetHeight(self.tabBar.bounds);
}

- (void)generateSeparatorLayerAtPosition:(CGPoint)position height:(CGFloat)height
{
  CALayer *layer = [CALayer layer];
  layer.backgroundColor = [[[UIColor blackColor] colorWithAlphaComponent:0.2] CGColor];
  layer.frame = (CGRect){
    position,
    0.5, height
  };
  [self.view.layer addSublayer:layer];
  [_separatorLayers addObject:layer];
}

@end
