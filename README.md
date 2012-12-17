NiftyButton is my attempt to replicate the style of the buttons used by [Twitter Bootstrap](http://twitter.github.com/boo$

The NiftyButton class enables developers to quickly create visually appealing buttons.     

Usage:

To create a button programmatically:

```
// Create a new button and set it to one of the predefined themes
NiftyButton *button = [NiftyButton alloc] initWithFrame:frame];
[button setColorThemeGreen];

// Create a new button using one of the convenience methods
NiftyButton *button = [NiftyButton yellowButtonWithFrame:frame];
/* Let's change the border color to black */
button.borderColor = [UIColor blackColor];

// Create a new button with a custom color style (red border with a blue to green gradient).
NiftyButton *button = [NiftyButton buttonWithBorderColor:[UIColor redColor] topColor:[UIColor blueColor] bottomColor:[UIColor greenColor] frame:aFrame];
```

Loading a NiftyButton from a xib:

Note: By default all NiftyButton instances created with initWithFrame or loaded from a xib (initWithCoder) use the white button theme.
The process for modifying the appearance of a button loaded from a xib file is essentially the same as the process for modifying a programmatically created button.  Once the button's superview has been loaded, use any of the instance methods or properties to customize the button's style.

## Example of the six predefined color styles:

![Example](http://i.imgur.com/Yv5rQ.png)

