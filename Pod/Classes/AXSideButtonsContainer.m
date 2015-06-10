//
//  AXSideButtonsContainer.m
//  Pods
//

#import "AXSideButtonsContainer.h"

@implementation AXSideButtonsContainer

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
  UIView *target = [super hitTest:point withEvent:event];
  if (target == self) {
    return nil;
  } else {
    return target;
  }
}

@end
