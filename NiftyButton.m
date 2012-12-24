#import "NiftyButton.h"
#import <UIKit/UIKit.h>

// Based on the CBHybrid class available from: https://github.com/kaishin/custom-UIButton

//
//  NiftyButton.m
//
//  Created by Stephen Melvin <stephenbmelvin@gmail.com> on 12/16/2012.
//  Copyright (c) 2012 Stephen Melvin. All rights reserved.
//

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation NiftyButton {
	UIImage *_normalBackgroundImage;
	UIImage *_highlightedBackgroundImage;
	UIImage *_selectedBackgroundImage;
	UIImage *_disabledBackgroundImage;
	
    int _borderRadius;
    int _height;
}

#pragma mark Class Methods

+ (NiftyButton*)buttonWithBorderColor:(UIColor *)aBorderColor topColor:(UIColor *)aTopColor bottomColor:(UIColor *)aBottomColor frame:(CGRect)aFrame{
    NiftyButton *newButton = [[NiftyButton alloc] initWithFrame:aFrame];
   
    if(newButton){
        newButton.borderColor = aBorderColor;
        newButton.topColor = aTopColor;
        newButton.bottomColor = aBottomColor;
        [newButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [newButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    }
    
    return newButton;
}

+ (NiftyButton*)whiteButtonWithFrame:(CGRect)aFrame{
    NiftyButton *newButton = [[NiftyButton alloc] initWithFrame:aFrame];
    [newButton setColorThemeWhite];
    return newButton;
}

+ (NiftyButton*)blackButtonWithFrame:(CGRect)aFrame{
    NiftyButton *newButton = [[NiftyButton alloc] initWithFrame:aFrame];
    [newButton setColorThemeBlack];
    return newButton;
}

+ (NiftyButton*)blueButtonWithFrame:(CGRect)aFrame{
    NiftyButton *newButton = [[NiftyButton alloc] initWithFrame:aFrame];
    
    [newButton setColorThemeBlue];
    [newButton setLabelColorWhite];
    return newButton;
}

+ (NiftyButton*)redButtonWithFrame:(CGRect)aFrame{
    NiftyButton *newButton = [[NiftyButton alloc] initWithFrame:aFrame];
    [newButton setColorThemeRed];
    
    return newButton;
}

+ (NiftyButton*)greenButtonWithFrame:(CGRect)aFrame{
    NiftyButton *newButton = [[NiftyButton alloc] initWithFrame:aFrame];
    [newButton setColorThemeGreen];
    [newButton setLabelColorWhite];
    
    return newButton;
}

+ (NiftyButton*)yellowButtonWithFrame:(CGRect)aFrame{
    NiftyButton *newButton = [[NiftyButton alloc] initWithFrame:aFrame];
    [newButton setColorThemeYellow];
    [newButton setLabelColorWhite];
    
    return newButton;
}

#pragma mark Instance Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _borderRadius = 4;
        _height = 37;
        
        [self setColorThemeWhite];
        [self setupBackgrounds];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self){
        self.frame = frame;
        
        _borderRadius = 4;
        _height = 37;
        
        [self setColorThemeWhite];
        [self setupBackgrounds];
    }
    
    return self;
}

- (void)setColorThemeWhite{
    _borderColor = UIColorFromRGB(0xd0d0d0);
    _topColor = UIColorFromRGB(0xFFFFFF);
    _bottomColor = UIColorFromRGB(0xE6E6E6);
    [self releaseBackgroundImages];
    [self setLabelColorBlack];
    [self setupBackgrounds];
}

- (void)setColorThemeBlack{
    _borderColor = UIColorFromRGB(0x303030);
    _topColor = UIColorFromRGB(0x444444);
    _bottomColor = UIColorFromRGB(0x222222);
    [self releaseBackgroundImages];
    [self setLabelColorWhite];
    [self setupBackgrounds];
}

- (void)setColorThemeRed{
    _borderColor = UIColorFromRGB(0xc44741);
    _topColor = UIColorFromRGB(0xEE5F5B);
    _bottomColor = UIColorFromRGB(0xBD362F);
    [self releaseBackgroundImages];
    [self setLabelColorWhite];
    [self setupBackgrounds];
}

- (void)setColorThemeBlue{
    _borderColor = UIColorFromRGB(0x0062b8);
    _topColor = UIColorFromRGB(0x0084cc);
    _bottomColor = UIColorFromRGB(0x0045cc);
    [self releaseBackgroundImages];
    [self setLabelColorWhite];
    [self setupBackgrounds];
}

- (void)setColorThemeYellow{
    _borderColor = UIColorFromRGB(0xe1962d);
    _topColor = UIColorFromRGB(0xFBB450);
    _bottomColor = UIColorFromRGB(0xF89406);
    [self releaseBackgroundImages];
    [self setLabelColorWhite];
    [self setupBackgrounds];
}

- (void)setColorThemeGreen{
    _borderColor = UIColorFromRGB(0x52a552);
    _topColor = UIColorFromRGB(0x62C462);
    _bottomColor = UIColorFromRGB(0x51A351);
    [self releaseBackgroundImages];
    [self setLabelColorWhite];
    [self setupBackgrounds];
}


- (void)setLabelColorWhite{
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self setTitleShadowColor:[UIColor colorWithWhite:0.0 alpha:0.25] forState:UIControlStateNormal];
    [self setTitleShadowColor:[UIColor colorWithWhite:0.0 alpha:0.25] forState:UIControlStateHighlighted];
    [[self titleLabel] setShadowOffset:CGSizeMake(0, -1)];
}

- (void)setLabelColorBlack{
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
}

- (void)setBottomColor:(UIColor *)bottomColor{
    _bottomColor = bottomColor;
    [self releaseBackgroundImages];
    [self setupBackgrounds];
}

- (void)setTopColor:(UIColor *)topColor{
    _topColor = topColor;
    [self releaseBackgroundImages];
    [self setupBackgrounds];
	
}

- (void)setBorderColor:(UIColor *)borderColor{
    _borderColor = borderColor;
    [self releaseBackgroundImages];
    [self setupBackgrounds];
}

- (void)releaseBackgroundImages{
    _gBackgroundImage = nil;
    _gBackgroundImageHighlighted = nil;
}

- (void)setupBackgrounds {
    
    // Generate background images if necessary
    if (!_gBackgroundImage && !_gBackgroundImageHighlighted) {
        _gBackgroundImage = [[self drawBackgroundImageHighlighted:NO] resizableImageWithCapInsets:UIEdgeInsetsMake(_borderRadius, _borderRadius, _borderRadius, _borderRadius) resizingMode:UIImageResizingModeStretch];
        _gBackgroundImageHighlighted = [[self drawBackgroundImageHighlighted:YES] resizableImageWithCapInsets:UIEdgeInsetsMake(_borderRadius, _borderRadius, _borderRadius, _borderRadius) resizingMode:UIImageResizingModeStretch];
    }
    
    // Set background for the button instance
    [self setBackgroundImage:_gBackgroundImage forState:UIControlStateNormal];
    [self setBackgroundImage:_gBackgroundImageHighlighted forState:UIControlStateHighlighted];
}

- (UIImage *)drawBackgroundImageHighlighted:(BOOL)highlighted {
    
    // Get image width with a 1pt stretchable area
    float width = 1 + (_borderRadius * 2);
    
    // Create bitmap context and color space
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(width, _height), NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    UIColor *innerGlow = [UIColor colorWithWhite:1.0 alpha:0.1];
    
    // Gradient Declarations
    NSArray *gradientColors = (@[
                               (id)_topColor.CGColor,
                               (id)_bottomColor.CGColor
                               ]);
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)(gradientColors), NULL);
    
    NSArray *highlightedGradientColors = (@[
                                          (id)_bottomColor.CGColor,
                                          (id)_topColor.CGColor
                                          ]);
    
    CGGradientRef highlightedGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)(highlightedGradientColors), NULL);
    
    
    // Draw rounded rectangle bezier path
    UIBezierPath *roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, 0, width, _height) cornerRadius: _borderRadius];
    
    // Use the bezier as a clipping path
    [roundedRectanglePath addClip];
    
    // Use one of the two gradients depending on the state of the button
    CGGradientRef background = highlighted? highlightedGradient : gradient;
    
    // Draw gradient within the path
    CGContextDrawLinearGradient(context, background, CGPointMake(140, 0), CGPointMake(140, _height-1), 0);
    
    // Draw border
    [_borderColor setStroke];
    roundedRectanglePath.lineWidth = 2;
    [roundedRectanglePath stroke];
    
    // Draw Inner Glow
    UIBezierPath *innerGlowRect = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(1.5, 1.5, width - 3, _height - 3) cornerRadius: _borderRadius * 4/5];
    [innerGlow setStroke];
    innerGlowRect.lineWidth = 1;
    [innerGlowRect stroke];
     
    
    // Output as Image
    UIImage* backgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // Cleanup
    UIGraphicsEndImageContext();
    CGGradientRelease(gradient);
    CGGradientRelease(highlightedGradient);
    CGColorSpaceRelease(colorSpace);
    
    return backgroundImage;
}

@end
