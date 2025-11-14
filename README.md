# Brute

A brutalist-inspired SwiftUI UI component library that brings bold, functional design to your iOS and macOS applications.

<!-- TODO: Add hero image showing brutalist design examples -->

## Overview

Brute is a comprehensive SwiftUI library that provides a collection of brutalist-styled components with strong visual hierarchy, bold borders, dramatic shadows, and vibrant color schemes. The library emphasizes functionality and visual clarity through its distinctive aesthetic.

### Key Features

- 🎨 **Multiple Theme Variants** — Violet, Blue, Orange, Green, and Multicolor themes
- 🧩 **Complete Component Library** — Buttons, cards, pickers, text fields, toggles, and more
- 🔄 **Theme Leveling System** — Hierarchical theme variations for nested components
- ⚙️ **Highly Customizable** — Override colors, dimensions, and fonts per-component
- 📱 **Cross-Platform** — Support for iOS 18+ and macOS 15+

## Installation

### Swift Package Manager

Add Brute to your project using Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/Lukas-Simonson/Brute.git", from: "1.0.0")
]
```

Then import it in your SwiftUI views:

```swift
import Brute
```

## Quick Start

Wrap your app content with `BruteStyle` to apply the brutalist design system:

```swift
import SwiftUI
import Brute

struct ContentView: View {
    var body: some View {
        BruteStyle {
            // Your content here
        }
    }
}
```

## Components

### BruteCard

A container view with brutalist styling, perfect for grouping related content.

```swift
BruteCard {
    Text("Card Title")
        .font(.title)
    Text("Card content goes here")
        .font(.subheadline)
}
.bruteTheme(.violet)
```

<!-- TODO: Add BruteCard example image -->

### BrutePicker

A customizable picker component with brutalist styling.

```swift
@State private var selection = "Account"
let tabs = ["Account", "Profile", "Settings"]

BrutePicker(selection: $selection) {
    ForEach(tabs, id: \.self) { value in
        Text(value)
    }
}
.brutePickerStyle(.segmented)
```

<!-- TODO: Add BrutePicker example image -->

### Button Styles

Brute provides multiple button style variants:

#### Default Button Style (`.brute`)

The primary button style with accent colors.

```swift
Button("Click Me") { 
    // Action
}
.buttonStyle(.brute)
```

#### Neutral Button Style (`.bruteNeutral`)

A secondary button style with neutral colors.

```swift
Button("Sign in with Google") {
    // Action
}
.buttonStyle(.bruteNeutral)
```

#### Reverse Button Style (`.bruteReverse`)

An inverted color scheme button style.

```swift
Button("Reverse Style") {
    // Action
}
.buttonStyle(.bruteReverse)
```

<!-- TODO: Add button styles comparison image -->

### Label Styles

#### Badge Label Style (`.bruteBadge`)

Creates small badge-style labels with three display modes.

```swift
Label("New", systemImage: "star.fill")
    .labelStyle(.bruteBadge) // Shows title and icon

Label("Featured", systemImage: "sparkle")
    .labelStyle(.bruteBadge(.titleOnly))

Label("Icon", systemImage: "leaf")
    .labelStyle(.bruteBadge(.iconOnly))
```

<!-- TODO: Add badge label examples image -->

### Other Components

Brute includes brutalist styles for:

- **Text Fields** — `.textFieldStyle(.brute)`
- **Toggles** — `.toggleStyle(.bruteSwitch)` & `.toggleStyle(.bruteCheckbox)`
- **Progress Views** — `.progressViewStyle(.brute)`
- **Gauges** — `.gaugeStyle(.brute)`
- **Disclosure Groups** — `.disclosureGroupStyle(.brute)`

## Theming

### Available Themes

Brute comes with five built-in themes:

- `.violet` — Purple-based color scheme (default)
- `.blue` — Blue-based color scheme
- `.orange` — Orange-based color scheme
- `.green` — Green-based color scheme
- `.multi` — Multicolor scheme

Apply themes using the `.bruteTheme()` modifier:

```swift
VStack {
    BruteCard { /* content */ }
        .bruteTheme(.violet)
    
    BruteCard { /* content */ }
        .bruteTheme(.blue)
}
```

<!-- TODO: Add theme comparison image -->

### Theme Leveling

Brute uses a hierarchical theme system where nested components automatically adjust their styling. You can manually control this with `.bruteThemeLeveled(by:)`:

```swift
BruteCard {
    Text("Parent Level")
    
    BruteCard {
        Text("Automatically elevated to level 1")
    }
    
    BruteCard {
        Text("Manually elevated")
    }
    .bruteThemeLeveled(by: 2)
}
```

### Custom Theme Configuration

Create your own theme by defining color, dimension, and font sets:

```swift
let customTheme = BruteTheme(
    colors: [.customColorScheme],
    dimensions: [.customDimensions],
    fonts: [.customFonts]
)

BruteStyle {
    // Your content
}
.bruteTheme(customTheme)
```

### Overriding Theme Components

Override specific aspects of the theme without creating a full custom theme:

```swift
BruteCard {
    // Content
}
.overrideBruteColor(customColorSet)
.overrideBruteDimen(customDimensionSet)
.overrideBruteFont(customFontSet)
```

## Advanced Features

### Brute Context

Access the current theme context in your custom views:

```swift
struct CustomView: View {
    @Environment(\.bruteContext) private var context
    
    var body: some View {
        Text("Custom")
            .font(context.font.title)
            .foregroundStyle(context.color.foreground)
            .padding(context.dimen.paddingMedium)
    }
}
```

### Manual Brutalization

Apply brutalist styling to any view with individual modifiers:

```swift
MyCustomView()
    .bruteClipped()     // Rounds corners
    .bruteStroked()     // Adds border
    .bruteShadow()      // Adds offset shadow
    
// Or apply all at once:
MyCustomView()
    .brutalized()
```

## Design Philosophy

Brute embraces brutalist design principles:

- **Bold Borders** — Strong, visible borders define component boundaries
- **Dramatic Shadows** — Offset shadows create depth and visual interest
- **High Contrast** — Clear distinction between foreground and background
- **Functional First** — Form follows function with no unnecessary decoration
- **Grid Background** — Optional grid overlay reinforces the structural aesthetic

## Requirements

- iOS 18.0+ or macOS 15.0+
- Swift 6.2+
- Xcode 16.0+

## Dependencies

Brute uses [SwiftUI-Flow](https://github.com/tevelee/SwiftUI-Flow) for flexible layout capabilities.

## Examples

Check out the included preview code in each component file for usage examples, or build the `BruteSamples` target to see all components in action.

<!-- TODO: Add comprehensive example app screenshot -->

## Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues for bugs and feature requests.

## License

[Include your license information here]

## Credits

Created by Lukas Simonson

---

**Note:** Brute is designed for apps that want to make a bold visual statement. The brutalist aesthetic may not be suitable for all applications — use it where you want to emphasize functionality and create a distinctive user experience.
