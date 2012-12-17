
// Based on the CBHybrid class available from: https://github.com/kaishin/custom-UIButton

//
//  NiftyButton.h
//
//  Created by Stephen Melvin <stephenbmelvin@gmail.com> on 12/16/2012.
//  Copyright (c) 2012 Stephen Melvin. All rights reserved.
//

@class UIButton;
@interface NiftyButton : UIButton

@property (nonatomic) UIColor *bottomColor;
@property (nonatomic) UIColor *topColor;
@property (nonatomic) UIColor *borderColor;

+ (NiftyButton*)buttonWithBorderColor:(UIColor*)aBorderColor topColor:(UIColor*)aTopColor bottomColor:(UIColor*)aBottomColor frame:(CGRect)aFrame;

+ (NiftyButton*)whiteButtonWithFrame:(CGRect)aFrame;
+ (NiftyButton*)blueButtonWithFrame:(CGRect)aFrame;
+ (NiftyButton*)redButtonWithFrame:(CGRect)aFrame;
+ (NiftyButton*)greenButtonWithFrame:(CGRect)aFrame;
+ (NiftyButton*)blackButtonWithFrame:(CGRect)aFrame;
+ (NiftyButton*)yellowButtonWithFrame:(CGRect)aFrame;

- (void)setColorThemeWhite;
- (void)setColorThemeBlack;
- (void)setColorThemeBlue;
- (void)setColorThemeRed;
- (void)setColorThemeGreen;
- (void)setColorThemeYellow;

@end
