#import "NiftyButton.h"
#import <UIKit/UIKit.h>

//  NiftyButton.m
//
//  Created by Stephen Melvin <stephenbmelvin@gmail.com> on 12/16/2012.
//  Copyright (c) 2012 Stephen Melvin. All rights reserved.
//
#define BORDER_RADIUS	4

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface NiftyButton ()
@property (nonatomic) NSString *theme;
@end

@implementation NiftyButton

#pragma mark Class Methods

+ (NiftyButton*)buttonWithBorderColor:(UIColor *)aBorderColor topColor:(UIColor *)aTopColor bottomColor:(UIColor *)aBottomColor frame:(CGRect)aFrame{
    NiftyButton *newButton = [[NiftyButton alloc] initWithFrame:aFrame];
   
    if(newButton){
        [newButton setButtonBorderColor:aBorderColor topColor:aTopColor bottomColor:aBottomColor forState:UIControlStateNormal];
        [newButton setLabelColorBlack];
    }

    return newButton;
}

+ (NiftyButton*)buttonWithTheme:(NiftyButtonColorTheme)colorTheme frame:(CGRect)aFrame{
	NiftyButton *newButton = [[NiftyButton alloc] initWithFrame:aFrame];
	
	if(newButton){
		[newButton setColorTheme:colorTheme];
	}
	
	return newButton;
}

#pragma mark Instance Methods

- (void)awakeFromNib{
	[self setLabelColorBlack];
	
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
	else{
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

- (void)setColorTheme:(NiftyButtonColorTheme)aTheme{
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
	
	[self setButtonBorderColor:borderColor topColor:topColor bottomColor:bottomColor forState:UIControlStateNormal];
	[self setButtonBorderColor:borderColor topColor:topColor bottomColor:bottomColor forState:UIControlStateDisabled];
	[self setButtonBorderColor:borderColor topColor:bottomColor bottomColor:topColor forState:UIControlStateHighlighted];
	[self setButtonBorderColor:borderColor topColor:bottomColor bottomColor:topColor forState:UIControlStateSelected];

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

@end
