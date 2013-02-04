/* 
The MIT License (MIT)
Copyright (c) 2012 Stephen Melvin <stephenbmelvin@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
	
	The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

#import "NiftyButton.h"
#import <UIKit/UIKit.h>

#define BORDER_RADIUS	4

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface NiftyButton ()
@property (nonatomic) NSString *theme;
@property (nonatomic) UIColor *bottomColor;
@property (nonatomic) UIColor *topColor;
@property (nonatomic) UIColor *borderColor;
@end

@implementation NiftyButton


+ (id)buttonWithBorderColor:(UIColor *)aBorderColor topColor:(UIColor *)aTopColor bottomColor:(UIColor *)aBottomColor frame:(CGRect)aFrame{
    NiftyButton *newButton = [[NiftyButton alloc] initWithFrame:aFrame];
   
    if(newButton){
		[newButton configureAllControlStatesUsingBorderColor:aBorderColor topColor:aTopColor bottomColor:aBottomColor];
        [newButton setLabelColorWhite];
    }

    return newButton;
}

+ (id)buttonWithTheme:(NiftyButtonColorTheme)colorTheme frame:(CGRect)aFrame{
	NiftyButton *newButton = [[NiftyButton alloc] initWithFrame:aFrame];
	
	if(newButton){
		[newButton setColorTheme:colorTheme];
	}
	
	return newButton;
}

- (void)awakeFromNib{
	[self setLabelColorBlack];
	
	// Configure the button's colors using user-defined keys
	if (self.theme) {
		
		if([self.theme isEqualToString:@"red"]){
			[self setColorTheme:NiftyButtonRedTheme];
		}
		else if([self.theme isEqualToString:@"white"]){
			[self setColorTheme:NiftyButtonWhiteTheme];
		}
		else if([self.theme isEqualToString:@"blue"]){
			[self setColorTheme:NiftyButtonBlueTheme];
		}
		else if([self.theme isEqualToString:@"black"]){
			[self setColorTheme:NiftyButtonBlackTheme];
		}
		else if([self.theme isEqualToString:@"green"]){
			[self setColorTheme:NiftyButtonGreenTheme];
		}
		else if([self.theme isEqualToString:@"yellow"]){
			[self setColorTheme:NiftyButtonYellowTheme];
		}
	}
	else if(self.topColor && self.bottomColor && self.borderColor){
		[self configureAllControlStatesUsingBorderColor:self.borderColor topColor:self.topColor bottomColor:self.bottomColor];
	}
	else {
		[self setColorTheme:NiftyButtonWhiteTheme];
	}
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self){
        self.frame = frame;
        
        [self setColorTheme:NiftyButtonWhiteTheme];
		[self setLabelColorBlack];
    }
    return self;
}

- (void)configureAllControlStatesUsingBorderColor:(UIColor *)aBorderColor topColor:(UIColor *)aTopColor bottomColor:(UIColor *)aBottomColor{
	[self setButtonBorderColor:aBorderColor topColor:aTopColor bottomColor:aBottomColor forState:UIControlStateNormal];
	[self setButtonBorderColor:aBorderColor topColor:aTopColor bottomColor:aBottomColor forState:UIControlStateDisabled];
	[self setButtonBorderColor:aBorderColor topColor:aBottomColor bottomColor:aTopColor forState:UIControlStateHighlighted];
	[self setButtonBorderColor:aBorderColor topColor:aBottomColor bottomColor:aTopColor forState:UIControlStateSelected];
}

- (void)configureAllControlStatesUsingTheme:(NiftyButtonColorTheme)aTheme{
	[self setColorTheme:aTheme forState:UIControlStateNormal showDepressed:NO];
	[self setColorTheme:aTheme forState:UIControlStateDisabled showDepressed:NO];
	[self setColorTheme:aTheme forState:UIControlStateHighlighted showDepressed:YES];
	[self setColorTheme:aTheme forState:UIControlStateSelected showDepressed:YES];
}

- (void)setColorTheme:(NiftyButtonColorTheme)aTheme{
	[self configureAllControlStatesUsingTheme:aTheme];
}

- (void)setColorTheme:(NiftyButtonColorTheme)aTheme forState:(UIControlState)aState showDepressed:(BOOL)depressed{
	UIColor *borderColor, *topColor, *bottomColor;
	
	switch (aTheme) {
		case NiftyButtonBlackTheme:
			borderColor = UIColorFromRGB(0x303030);
			topColor = UIColorFromRGB(0x444444);
			bottomColor = UIColorFromRGB(0x222222);
			break;
			
		case NiftyButtonWhiteTheme:
			borderColor = UIColorFromRGB(0xd0d0d0);
			topColor = UIColorFromRGB(0xFFFFFF);
			bottomColor = UIColorFromRGB(0xE6E6E6);
			break;
			
		case NiftyButtonBlueTheme:
			borderColor = UIColorFromRGB(0x0062b8);
			topColor = UIColorFromRGB(0x0084cc);
			bottomColor = UIColorFromRGB(0x0045cc);
			break;
			
		case NiftyButtonGreenTheme:
			borderColor = UIColorFromRGB(0x52a552);
			topColor = UIColorFromRGB(0x62C462);
			bottomColor = UIColorFromRGB(0x51A351);
			break;
			
		case NiftyButtonRedTheme:
			borderColor = UIColorFromRGB(0xc44741);
			topColor = UIColorFromRGB(0xEE5F5B);
			bottomColor = UIColorFromRGB(0xBD362F);
			break;
			
		case NiftyButtonYellowTheme:
			borderColor = UIColorFromRGB(0xe1962d);
			topColor = UIColorFromRGB(0xFBB450);
			bottomColor = UIColorFromRGB(0xF89406);
			break;
	}
	
	if(aTheme == NiftyButtonWhiteTheme){
		[self setLabelColorBlack];
	}
	else{
		[self setLabelColorWhite];
	}
	
	if (depressed) {
		[self setButtonBorderColor:borderColor topColor:bottomColor bottomColor:topColor forState:aState];
	}
	else {
		[self setButtonBorderColor:borderColor topColor:topColor bottomColor:bottomColor forState:aState];
	}
}

- (void)setLabelColorWhite{
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
	[self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
	[self setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
	
    [self setTitleShadowColor:[UIColor colorWithWhite:0.0 alpha:0.25] forState:UIControlStateNormal];
    [self setTitleShadowColor:[UIColor colorWithWhite:0.0 alpha:0.25] forState:UIControlStateHighlighted];
	[self setTitleShadowColor:[UIColor colorWithWhite:0.0 alpha:0.25] forState:UIControlStateSelected];
	[self setTitleShadowColor:[UIColor colorWithWhite:0.0 alpha:0.25] forState:UIControlStateDisabled];
    [[self titleLabel] setShadowOffset:CGSizeMake(0, -1)];
}

- (void)setLabelColorBlack{
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateDisabled];
}

- (void)setButtonBorderColor:(UIColor *)aBorderColor topColor:(UIColor *)aTopColor bottomColor:(UIColor *)aBottomColor forState:(UIControlState)aState{
	UIImage *backgroundImage = [self backgroundImageWithBorderColor:aBorderColor topColor:aTopColor bottomColor:aBottomColor];
	
	[self setBackgroundImage:backgroundImage forState:aState];
}

- (UIImage *)backgroundImageWithBorderColor:(UIColor*)aBorderColor topColor:(UIColor*)aTopColor bottomColor:(UIColor*)aBottomColor{
	
    float width = self.frame.size.width;
	float height = self.frame.size.height;
	
    // Create bitmap context and color space
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(width, height), NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    UIColor *innerGlow = [UIColor colorWithWhite:1.0 alpha:0.1];
    
    // Gradient Declarations
    NSArray *gradientColors = (@[
                               (id)aTopColor.CGColor,
                               (id)aBottomColor.CGColor
                               ]);
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)(gradientColors), NULL);

    // Draw rounded rectangle bezier path
    UIBezierPath *roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, 0, width, height) cornerRadius: BORDER_RADIUS];
    
    // Use the bezier as a clipping path
    [roundedRectanglePath addClip];
    
    // Draw gradient within the path
    CGContextDrawLinearGradient(context, gradient, CGPointMake(140, 0), CGPointMake(140, height-1), 0);
    
    // Draw border
    [aBorderColor setStroke];
    roundedRectanglePath.lineWidth = 2;
    [roundedRectanglePath stroke];
    
    // Draw Inner Glow
    UIBezierPath *innerGlowRect = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(1.5, 1.5, width - 3, height - 3) cornerRadius: BORDER_RADIUS * 4/5];
    [innerGlow setStroke];
    innerGlowRect.lineWidth = 1;
    [innerGlowRect stroke];
     
    
    // Output as Image
    UIImage *backgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // Cleanup
    UIGraphicsEndImageContext();
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
    return backgroundImage;
}

- (void)setTitleForAllStates:(NSString *)title{
	[self setTitle:title forState:UIControlStateNormal];
	[self setTitle:title forState:UIControlStateReserved];
	[self setTitle:title forState:UIControlStateSelected];
	[self setTitle:title forState:UIControlStateHighlighted];
	[self setTitle:title forState:UIControlStateDisabled];	
}

@end
