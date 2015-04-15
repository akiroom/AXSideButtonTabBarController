//
//  AXSideButton.m
//  Pods
//

#import "AXSideButton.h"

@implementation AXSideButton {
  NSDate *_lastTouchDownTime;
}

- (instancetype)initWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
  return [self initWithTitle:title image:nil target:target action:action];
}

- (instancetype)initWithImage:(UIImage *)image target:(id)target action:(SEL)action
{
  return [self initWithTitle:nil image:image target:target action:action];
}

- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image target:(id)target action:(SEL)action
{
  if (self = [super init]) {
    [self configureAXSideButton];
    _titleLabel.text = title;
    _imageView.image = image;
    self.tintColor = [UIColor colorWithWhite:0.1 alpha:0.8];
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
  const CGFloat kContentPadding = 4.0;
  const CGFloat kImageWidth = 26.0;
  _contentInsets = UIEdgeInsetsMake(0.0, kContentPadding, 0.0, kContentPadding);
  _preferredImageSize = (CGSize){kImageWidth, kImageWidth};
  if (!_imageView) {
    _imageView = [[UIImageView alloc] init];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_imageView];
  }
  if (!_titleLabel) {
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.adjustsFontSizeToFitWidth = YES;
    _titleLabel.minimumScaleFactor = 0.5;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont systemFontOfSize:[UIFont systemFontSize] - 4.0];
    _titleLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    _titleLabel.highlightedTextColor = [UIColor whiteColor] ;
    [self addSubview:_titleLabel];
  }
  [self updateTintColor:self.tintColor];
}

- (void)layoutSubviews
{
  // TODO: calc these frames.
  CGRect contentFrame = UIEdgeInsetsInsetRect(self.bounds, _contentInsets);
  CGRect imageViewFrame;
  if (!_titleLabel || _titleLabel.isHidden || _titleLabel.text.length == 0) {
    imageViewFrame = contentFrame;
  } else {
    const CGFloat titleLabelHeight = 14.0;
    _titleLabel.frame = (CGRect){
      CGRectGetMinX(contentFrame), CGRectGetMaxY(contentFrame) - titleLabelHeight,
      CGRectGetWidth(contentFrame), titleLabelHeight
    };
    imageViewFrame = (CGRect){
      contentFrame.origin,
      CGRectGetWidth(contentFrame), CGRectGetHeight(contentFrame) - titleLabelHeight
    };
  }
  _imageView.center = (CGPoint){
    CGRectGetMidX(imageViewFrame), CGRectGetMidY(imageViewFrame)
  };
  _imageView.bounds = (CGRect){
    CGPointZero, _preferredImageSize
  };
}

#pragma mark -  Override

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  [super touchesBegan:touches withEvent:event];
  _lastTouchDownTime = [NSDate date];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
  [super touchesEnded:touches withEvent:event];
  if (fabs([_lastTouchDownTime timeIntervalSinceNow]) <  0.1) {
    [self updateTinted:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      [self updateTinted:NO];
    });
  }
}

#pragma mark - Property

- (void)setSelected:(BOOL)selected
{
  [super setSelected:selected];
  [self updateTinted:selected];
}

- (void)setHighlighted:(BOOL)highlighted
{
  [super setHighlighted:highlighted];
  [self updateTinted:highlighted];
}

- (void)setContentInsets:(UIEdgeInsets)contentInsets
{
  if (!UIEdgeInsetsEqualToEdgeInsets(_contentInsets, contentInsets)) {
    _contentInsets = contentInsets;
    [self setNeedsLayout];
  }
}

- (void)setPreferredImageSize:(CGSize)preferredImageSize
{
  if (!CGSizeEqualToSize(_preferredImageSize, preferredImageSize)) {
    _preferredImageSize = preferredImageSize;
    [self setNeedsLayout];
  }
}

- (void)setTintColor:(UIColor *)tintColor
{
  [super setTintColor:tintColor];
  [self updateTintColor:tintColor];
}

#pragma mark - Private method

- (void)updateTinted:(BOOL)tinted
{
  _titleLabel.highlighted = tinted;
  _imageView.tintColor = (tinted ?
                          [UIColor colorWithWhite:1.0 alpha:0.8] :
                          self.tintColor);
 }

- (void)updateTintColor:(UIColor *)tintColor
{
  _titleLabel.textColor = tintColor;
  _imageView.tintColor = tintColor;
}

@end
