//
//  AXSideButton.h
//  Pods
//

#import <UIKit/UIKit.h>

@class AXSideButton;

@protocol AXSideButton <NSObject>
@optional
- (CGFloat)preferredWidth;
@end

@interface AXSideButton : UIControl <AXSideButton>
@property (readonly, nonatomic) UIImageView *imageView;
@property (readonly, nonatomic) UILabel *titleLabel;
@property (nonatomic)  UIEdgeInsets contentInsets;
@property (nonatomic) CGSize preferredImageSize;
//@property (nonatomic) CGFloat preferredWidth;
- (instancetype)initWithTitle:(NSString *)title target:(id)target action:(SEL)action;
- (instancetype)initWithImage:(UIImage *)image target:(id)target action:(SEL)action;
- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image target:(id)target action:(SEL)action;
@end
