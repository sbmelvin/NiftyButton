### NiftyButton is my attempt to replicate the style of the buttons used by [Twitter Bootstrap](http://twitter.github.com/bootstrap/components.html#buttonDropdowns).

The NiftyButton class enables developers to quickly create visually appealing buttons.     

You can create NiftyButtons programmatically or using Interface Builder. 

To create a button you must first decide whether you want to use one of the six predefined color themes or whether you want to roll your own. Don't worry, the look of a button can always be changed later. 
## Usage:

The easiest way to create a NiftyButton is to use one of the six predefined color themes. Valid color-theme values are: 

- NiftyButtonBlackTheme
- NiftyButtonWhiteTheme
- NiftyButtonBlueTheme
- NiftyButtonRedTheme
- NiftyButtonGreenTheme
- NiftyButtonYellowTheme

## Examples of the six predefined color styles:
![Example](http://i.imgur.com/x9WGb.png)

Using a color-theme will automatically configure your button's text and text-shadow attributes. The white theme will change the text to black; All other themes change the text to white. Text attributes can be changed at any time, but remember that using a method that sets a predefined color-theme will also change the text attributes.

##Creating a button programmatically:

#### Creating a new button using a predefined theme:
```objectivec
NiftyButton *button = [NiftyButton buttonWithTheme:NiftyButtonBlackTheme frame:buttonFrame];
```

#### Creating a new button with custom attributes:
This button will have a red to blue top-down gradient and a black border.
```objectivec
NiftyButton *button = [NiftyButton buttonWithBorderColor:[UIColor blackColor] topColor:[UIColor redColor] bottomColor:[UIColor blueColor] frame:myFrame];
```

#### Creating a new button using initWithFrame:
Sometimes you need to create a button instance, yet don't know it's color properties ahead of time. Using initWithFrame: will create a new NiftyButton with the white color theme. As with all NiftyButtons, you can customize this button at any time.
```objectivec
NiftyButton *button = [[NiftyButton alloc] initWithFrame:buttonFrame];
```
#### Customizing an already instantiated button:
```objectivec
NiftyButton *button = [[NiftyButton alloc] initWithFrame:buttonFrame];

// Let's use the red color theme.
[button setColorTheme:NiftyButtonRedTheme];

// I'd really like the button to be blue when highlighted and selected.
[button setButtonBorderColor:[UIColor blackColor] topColor:[UIColor blueColor] bottomColor:[UIColor blueColor] forState:UIControlStateHighlighted];

[button setButtonBorderColor:[UIColor blackColor] topColor:[UIColor blueColor] bottomColor:[UIColor blueColor] forState:UIControlStateSelected];

// Normally, setting the theme of a button modifies all the UIControlStates. However, if you want more control, you can set individual predefined themes to individual UIControlStates.

// Set the green color theme on the highlighted state. Now when the button is pressed, the button will turn green. When the button is released, the button will return to its UIControlStateNormal theme. Note: By default this method does not swap the top and bottom colors when the UIControlState is highlighted or selected, as is the default for all the other theme methods. To give your button the "pressed in" look for the specified state, set showDepressed to YES.
 
[button setColorTheme:NiftyButtonGreenTheme forState:UIControlStateHighlighted showDepressed:YES];
```

## Creating a button using Interface Builder:
Use NiftyButton like any other subclass of a UIKit class. Drag a UIButton into the view you wish to display the button, set its class to NiftyButton, make your IBOutlet and IBAction connections, and customize your button in code. If you are using iOS7, make sure you explicitly choose the Custom button type in interface builder. Not doing so will cause the buttons to darken when highlighted.

## Creating a button *entirely* in Interface Builder:
If you're simply setting a color theme across all UIControlStates, then it's possible to create a button entirely in IB.

1. Drag a UIButton into the view and position it where you want it.
2. Select the button. On the right, open the Identify Inspector and set its class to NiftyButton.
3. In the Identify Inspector, expand the User Defined Runtime Attributes section.

### To set a predefined color theme:
Click the + to add a key path. Name the key path **theme**, give it the type **String**, and for the value specify the name of the theme you wish to use:

- white
- black
- red
- blue
- green
- yellow 

You should have something like this:

![ColorTheme](http://i.imgur.com/tb7TM.png)


### Using a custom color theme:
Click the + button and create three key paths. Name the first **topColor**, the second **bottomColor**, and the third **borderColor**. Give all three key paths the type **Color**. Use the color palette in the Value column to choose a color for each of the key paths. 

![CustomTheme](http://i.imgur.com/7fpPl.png)
