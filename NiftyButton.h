
// Based on the CBHybrid class available from: https://github.com/kaishin/custom-UIButton

//
//  NiftyButton.h
//
//  Created by Stephen Melvin <stephenbmelvin@gmail.com> on 12/16/2012.
//  Copyright (c) 2012 Stephen Melvin. All rights reserved.
//

typedef NS_ENUM(NSUInteger, NiftyButtonColorTheme)
	{
		NiftyButtonBlackTheme,
		NiftyButtonWhiteTheme,
		NiftyButtonBlueTheme,
		NiftyButtonRedTheme,
		NiftyButtonGreenTheme,
		NiftyButtonYellowTheme
	};

@class UIButton;
@interface NiftyButton : UIButton

@property (nonatomic) UIColor *normalBottomColor;
@property (nonatomic) UIColor *normalTopColor;
@property (nonatomic) UIColor *normalBorderColor;
@property (nonatomic) UIColor *highlightedBottomColor;
@property (nonatomic) UIColor *highlightedTopColor;
@property (nonatomic) UIColor *highlightedBorderColor;
@property (nonatomic) UIColor *selectedBottomColor;
@property (nonatomic) UIColor *selectedTopColor;
@property (nonatomic) UIColor *selectedBorderColor;
@property (nonatomic) UIColor *disabledBottomColor;
@property (nonatomic) UIColor *disabledTopColor;
@property (nonatomic) UIColor *disabledBorderColor;

+ (NiftyButton*)buttonWithBorderColor:(UIColor*)aBorderColor topColor:(UIColor*)aTopColor bottomColor:(UIColor*)aBottomColor frame:(CGRect)aFrame;

+ (NiftyButton*)buttonWithTheme:(NiftyButtonColorTheme) frame:(CGRect)aFrame;

- (void)setButtonBorderColor:(UIColor*)aBorderColor topColor:(UIColor*)aTopColor bottomColor:(UIColor*)aBottomColor forState:(UIControlState)aState;

- (void)setColorTheme:(NiftyButtonColorTheme)aTheme forState:(UIControlState)aState;

@end
