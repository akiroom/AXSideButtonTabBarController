//
//  AXSideButton.m
//  Pods
//

#import "AXSideButton.h"

@implementation AXSideButton

- (instancetype)initWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
  if (self = [super init]) {
    [self configureAXSideButton];
    _titleLabel.text = title;
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
  }
  return self;
}

- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image target:(id)target action:(SEL)action
{
  if (self = [super init]) {
    [self configureAXSideButton];
    _titleLabel.text = title;
    _imageView.image = image;
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
  }
  return self;
}

- (void)awakeFromNib
{
  [self configureAXSideButton];
}

- (void)configureAXSideButton
{
  const CGFloat kDefaultPadding = 4.0;
  _contentInsets = UIEdgeInsetsMake(kDefaultPadding, kDefaultPadding, kDefaultPadding, kDefaultPadding);
  if (!_titleLabel) {
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.adjustsFontSizeToFitWidth = YES;
    _titleLabel.minimumScaleFactor = 0.5;
    [self addSubview:_titleLabel];
  }
  if (!_imageView) {
    _imageView = [[UIImageView alloc] init];
    _imageView.contentMode = UIViewContentModeCenter;
    [self addSubview:_imageView];
  }
  [self updateTintColor:self.tintColor];
}

- (void)layoutSubviews
{
  // TODO: calc these frames.
  CGRect contentFrame = UIEdgeInsetsInsetRect(self.bounds, _contentInsets);
  _imageView.frame = contentFrame;
  _titleLabel.frame = contentFrame;
}

#pragma mark - Property

- (void)setContentInsets:(UIEdgeInsets)contentInsets
{
  if (!UIEdgeInsetsEqualToEdgeInsets(_contentInsets, contentInsets)) {
    _contentInsets = contentInsets;
    [self setNeedsLayout];
  }
}

#pragma mark - Private method

- (void)updateTintColor:(UIColor *)tintColor
{
  _titleLabel.textColor = tintColor;
  _imageView.tintColor = tintColor;
}

@end
