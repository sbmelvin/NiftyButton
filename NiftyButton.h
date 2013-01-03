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

+ (id)buttonWithBorderColor:(UIColor*)aBorderColor topColor:(UIColor*)aTopColor bottomColor:(UIColor*)aBottomColor frame:(CGRect)aFrame;
+ (id)buttonWithTheme:(NiftyButtonColorTheme)colorTheme frame:(CGRect)aFrame;

- (void)setButtonBorderColor:(UIColor*)aBorderColor topColor:(UIColor*)aTopColor bottomColor:(UIColor*)aBottomColor forState:(UIControlState)aState;
- (void)setColorTheme:(NiftyButtonColorTheme)aTheme;
- (void)setColorTheme:(NiftyButtonColorTheme)aTheme forState:(UIControlState)aState showDepressed:(BOOL)depressed;

- (void)setLabelColorWhite;
- (void)setLabelColorBlack;
@end
