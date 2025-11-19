
<img alt="Brute" src="https://raw.githubusercontent.com/Lukas-Simonson/Brute/refs/heads/main/Resources/Images/brute_icon.png" width="256">

A comprehensive Neo-Brutalist design system for SwiftUI, featuring bold borders, offset shadows, and vibrant color themes.

## Features

- **Multi-Level Theming** - Hierarchical theme system supporting nested color variations
- **Pre-built Components** - Cards, notices, pickers, and more with brutalist styling
- **Custom Styles** - Brutalist implementations for buttons, toggles, text fields, progress views, and other SwiftUI controls
- **Flexible Theming** - Five built-in color themes (Violet, Blue, Orange, Green, Multi) plus custom theme support
- **Dark Mode Support** - Automatic color scheme adaptation
- **View Modifiers** - Easy-to-use modifiers for applying brutalist styling to any view

## Requirements

- iOS 15.0+ / macOS 12.0+ / tvOS 15.0+ / watchOS 8.0+
- Swift 5.9+
- Xcode 15.0+

## Installation

### Swift Package Manager

Add Brute to your project using Xcode:

1. Go to File → Add Package Dependencies
2. Enter the package URL:
   ```
   https://github.com/YOUR_USERNAME/Brute
   ```
3. Select the version you want to use

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/Lukas-Simonson/Brute", from: "1.0.0")
]
```

## Quick Start

Wrap your app's content in `BruteStyle` to apply the brutalist design system:

```swift
import SwiftUI
import Brute

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            BruteStyle {
                ContentView()
            }
        }
    }
}
```

## Core Components

### BruteCard

A styled container for presenting content in a card format:

```swift
BruteCard {
    Text("Card Content")
    Text("With multiple views")
}
```

<img alt="Brute Card Preview" src="https://raw.githubusercontent.com/Lukas-Simonson/Brute/refs/heads/main/Resources/Images/card_example.png" width="384">

### BruteNotice

Display important information with prominent styling:

```swift
VStack {
    BruteNotice("Info", systemImage: "info.circle") {
        Text("This is an informational notice component")
    }

    BruteNotice("Important", systemImage: "exclamationmark.triangle", fill: .yellow) {
        Text("Notices can highlight important information")
    }

    BruteNotice("Error", systemImage: "exclamationmark.circle", fill: .red) {
        Text("And can be customized with a special fill color")
    }
}
.padding()
```

<img alt="Brute Notice Preview" src="https://raw.githubusercontent.com/Lukas-Simonson/Brute/refs/heads/main/Resources/Images/notice_example.png" width="384">

### BrutePicker

A customizable picker with brutalist styling:

```swift
@State private var selection = "Option 1"
let options = ["Option 1", "Option 2", "Option 3"]

var body: some View {
    BrutePicker(selection: $selection) {
        ForEach(options, id: \.self) { option in
            Text(option)
        }
    }
    .padding()
}
```

<img alt="Brute Picker Preview" src="https://raw.githubusercontent.com/Lukas-Simonson/Brute/refs/heads/main/Resources/Images/brute_picker_example.png" width="384">

## Theming

### Using Built-in Themes

Apply themes using the `.bruteTheme()` modifier:

```swift
VStack {
    Text("Violet Theme")
        .bruteTheme(.violet)

    Text("Blue Theme")
        .bruteTheme(.blue)

    Text("Orange Theme")
        .bruteTheme(.orange)

    Text("Green Theme")
        .bruteTheme(.green)
}
```

### Available Themes

- `.violet` - Purple/violet color scheme
- `.blue` - Blue color scheme
- `.orange` - Orange color scheme
- `.green` - Green color scheme
- `.magenta` - Magenta color scheme
- `.maroon` - Maroon color scheme
- `.multi` - Multi-color gradient theme

<img alt="Color Palette Comparison" src="https://raw.githubusercontent.com/Lukas-Simonson/Brute/refs/heads/main/Resources/Images/color_palette_comparison.png" width="384">

### Creating Custom Themes

Create custom themes by defining color sets for light and dark modes:

```swift
let customTheme = BruteTheme(
    light: BruteTheme.ColorSet(
        foreground: .black,
        background: .white,
        // ... other colors
    ),
    dark: BruteTheme.ColorSet(
        foreground: .white,
        background: .black,
        // ... other colors
    ),
    level: 0
)

// Apply custom theme
MyView()
    .bruteTheme(customTheme)
```

## Styles

Brute provides custom implementations for many SwiftUI style protocols:

### Button Styles

```swift
// Primary button with shadow animation
Button("Press Me") { }
    .buttonStyle(.brute)

// Basic button with opacity feedback
Button("Basic") { }
    .buttonStyle(.bruteBasic)

// Neutral colors for secondary actions
Button("Secondary") { }
    .buttonStyle(.bruteNeutral)

// Reverse shadow animation
Button("Reverse") { }
    .buttonStyle(.bruteReverse)
```

<img alt="Button Style Comparison" src="https://raw.githubusercontent.com/Lukas-Simonson/Brute/refs/heads/main/Resources/Images/button_style_comparison.png" width="384">

### Toggle Styles

```swift
// Checkbox style
Toggle("Accept", isOn: $accepted)
    .toggleStyle(.bruteCheckbox)

// Switch style
Toggle("Enable", isOn: $enabled)
    .toggleStyle(.bruteSwitch)
```

<img alt="Toggle Style Comparison" src="https://raw.githubusercontent.com/Lukas-Simonson/Brute/refs/heads/main/Resources/Images/toggle_style_comparison.png" width="384">

### Text Field Style

```swift
TextField("Enter text", text: $text)
    .textFieldStyle(.brute)
```

**Note:** The text field style uses private SwiftUI APIs and should be applied directly to each `TextField` instance.

### Progress View Style

```swift
// Determinate progress
ProgressView("Loading", value: 0.5)
    .progressViewStyle(.brute)

// Indeterminate progress
ProgressView("Loading...")
    .progressViewStyle(.brute)
```

<img alt="Progress View Style Example" src="https://raw.githubusercontent.com/Lukas-Simonson/Brute/refs/heads/main/Resources/Images/progress_view_style_example.png" width="384">

### Label Styles

```swift
// Accent-colored badge
Label("New", systemImage: "star")
    .labelStyle(.bruteBadge)

// Neutral badge
Label("Info", systemImage: "info.circle")
    .labelStyle(.bruteBadgeNeutral)
```

<img alt="Label Style Comparison" src="https://raw.githubusercontent.com/Lukas-Simonson/Brute/refs/heads/main/Resources/Images/label_style_comparison.png" width="384">

### Other Styles

- **Gauge Style**: `.brute` - Progress gauge with filled bar
- **Disclosure Group Style**: `.brute` - Animated expand/collapse

## View Modifiers

Apply brutalist styling to any view:

```swift
// Complete brutalist treatment
MyView()
    .brutalized()

// With custom background
MyView()
    .brutalized(with: .red)

// Individual modifiers
MyView()
    .bruteClipped()      // Rounded corners
    .bruteStroked()      // Border stroke
    .bruteShadow()       // Offset shadow
```

## Advanced Usage

### Multi-Level Theming

Themes support hierarchical levels for nested components:

```swift
VStack {
    Text("Level 0")
        .bruteTheme(.violet)

    VStack {
        Text("Level 1 - Darker variation")
    }
    .bruteTheme(.violet, level: 1)
}
```

### Accessing Theme Context

Access theme values directly in custom views:

```swift
struct CustomView: View {
    @Environment(\.bruteContext) private var context

    var body: some View {
        Text("Custom")
            .foregroundStyle(context.color.accentForeground)
            .padding(context.dimen.paddingMedium)
            .font(context.font.title)
    }
}
```

## Documentation

For detailed documentation of all components, styles, and modifiers, see the inline documentation in the source code.
