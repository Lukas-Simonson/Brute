//
//  ColorSet.swift
//  Brute
//
//  Created by Lukas Simonson on 11/13/25.
//

import SwiftUI

extension BruteTheme {
    /// A set of colors defining the visual style for a specific theme and level.
    ///
    /// `ColorSet` provides semantic color values for foreground, background, accent, neutral,
    /// and border elements. These colors are typically used together to create a cohesive visual design.
    ///
    /// ## Usage
    ///
    /// Access colors from the current theme context:
    ///
    /// ```swift
    /// @Environment(\.bruteContext) var theme
    ///
    /// Text("Hello")
    ///     .foregroundColor(theme.color.foreground)
    ///     .background(theme.color.background)
    /// ```
    public struct ColorSet {
        /// Primary text and icon color.
        public let foreground: Color

        /// Primary background color for surfaces.
        public let background: Color

        /// Text and icon color for accent/emphasis elements.
        public let accentForeground: Color

        /// Background color for accent/emphasis elements like buttons or highlights.
        public let accentBackground: Color

        /// Text and icon color for neutral/secondary elements.
        public let neutralForeground: Color

        /// Background color for neutral/secondary elements.
        public let neutralBackground: Color

        /// Color for borders, outlines, and dividers.
        public let border: Color
    }

    /// A container for color sets that adapts to light and dark color schemes.
    ///
    /// `ColorSchemeSet` maps SwiftUI's `ColorScheme` (light/dark) to appropriate `ColorSet` instances,
    /// enabling automatic theme adaptation based on system appearance.
    ///
    /// - Important: Must include a light color scheme. Dark mode will fall back to light if not provided.
    public struct ColorSchemeSet {
        private let colors: [ColorScheme: ColorSet]

        /// Creates a new color scheme set with the provided color mappings.
        ///
        /// - Parameter colors: Dictionary mapping color schemes to their respective color sets.
        /// - Precondition: Must include a `.light` color scheme.
        public init(colors: [ColorScheme: ColorSet]) {
            assert(colors.keys.contains(.light), "ColorSchemeSet must include the `light` scheme.")
            self.colors = colors
        }

        /// Returns the color set for the specified color scheme.
        ///
        /// If the requested scheme is not available, falls back to the light scheme.
        ///
        /// - Parameter scheme: The color scheme to retrieve colors for.
        /// - Returns: The appropriate color set for the given scheme.
        func color(for scheme: ColorScheme) -> ColorSet {
            return colors[scheme] ?? colors[.light]!
        }
    }
}

// MARK: - Violet Color Sets

/// Predefined violet color sets for light and dark modes at different theme levels.
extension BruteTheme.ColorSet {
    /// Violet color set for level zero in light mode.
    ///
    /// Features a soft purple background with darker purple accents.
    public static var violetZeroLight: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 238, g: 230, b: 254),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 170, g: 133, b: 255),
            neutralForeground: Color(r: 0, g: 0, b: 0),
            neutralBackground: Color(r: 255, g: 255, b: 255),
            border: Color(r: 0, g: 0, b: 0),
        )
    }

    public static var violetZeroDark: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 51, g: 35, b: 82),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 169, g: 133, b: 255),
            neutralForeground: Color(r: 255, g: 255, b: 255),
            neutralBackground: Color(r: 31, g: 31, b: 31),
            border: Color(r: 0, g: 0, b: 0),
        )
    }

    // MARK: Level One
    public static var violetOneLight: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 255, g: 255, b: 255),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 206, g: 183, b: 255),
            neutralForeground: Color(r: 0, g: 0, b: 0),
            neutralBackground: Color(r: 255, g: 255, b: 255),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    public static var violetOneDark: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 31, g: 31, b: 31),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 206, g: 183, b: 255),
            neutralForeground: Color(r: 255, g: 255, b: 255),
            neutralBackground: Color(r: 31, g: 31, b: 31),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    // MARK: Level Two
    public static var violetTwoLight: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 248, g: 245, b: 255),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 188, g: 158, b: 255),
            neutralForeground: Color(r: 0, g: 0, b: 0),
            neutralBackground: Color(r: 255, g: 255, b: 255),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    public static var violetTwoDark: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 41, g: 28, b: 66),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 188, g: 158, b: 255),
            neutralForeground: Color(r: 255, g: 255, b: 255),
            neutralBackground: Color(r: 31, g: 31, b: 31),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

}

/// Predefined violet color scheme sets combining light and dark modes.
extension BruteTheme.ColorSchemeSet {
    /// Violet color scheme set for theme level zero.
    public static var violetZero: BruteTheme.ColorSchemeSet {
        BruteTheme.ColorSchemeSet(
            colors: [
                .light: .violetZeroLight,
                .dark: .violetZeroDark,
            ]
        )
    }

    public static var violetOne: BruteTheme.ColorSchemeSet {
        BruteTheme.ColorSchemeSet(
            colors: [
                .light: .violetOneLight,
                .dark: .violetOneDark,
            ]
        )
    }

    public static var violetTwo: BruteTheme.ColorSchemeSet {
        BruteTheme.ColorSchemeSet(
            colors: [
                .light: .violetTwoLight,
                .dark: .violetTwoDark,
            ]
        )
    }
}

// MARK: - Blue Color Sets

/// Predefined blue color sets for light and dark modes at different theme levels.
extension BruteTheme.ColorSet {
    
    public static var blueZeroLight: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 224, g: 242, b: 254),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 125, g: 211, b: 252),
            neutralForeground: Color(r: 0, g: 0, b: 0),
            neutralBackground: Color(r: 255, g: 255, b: 255),
            border: Color(r: 0, g: 0, b: 0),
        )
    }

    public static var blueZeroDark: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 30, g: 58, b: 82),
            accentForeground: Color(r: 229, g: 229, b: 229),
            accentBackground: Color(r: 125, g: 211, b: 252),
            neutralForeground: Color(r: 255, g: 255, b: 255),
            neutralBackground: Color(r: 31, g: 31, b: 31),
            border: Color(r: 0, g: 0, b: 0),
        )
    }

    // MARK: Level One
    public static var blueOneLight: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 255, g: 255, b: 255),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 186, g: 230, b: 253),
            neutralForeground: Color(r: 0, g: 0, b: 0),
            neutralBackground: Color(r: 255, g: 255, b: 255),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    public static var blueOneDark: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 31, g: 31, b: 31),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 186, g: 230, b: 253),
            neutralForeground: Color(r: 255, g: 255, b: 255),
            neutralBackground: Color(r: 31, g: 31, b: 31),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    // MARK: Level Two
    public static var blueTwoLight: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 240, g: 249, b: 255),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 147, g: 197, b: 253),
            neutralForeground: Color(r: 0, g: 0, b: 0),
            neutralBackground: Color(r: 255, g: 255, b: 255),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    public static var blueTwoDark: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 23, g: 37, b: 84),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 147, g: 197, b: 253),
            neutralForeground: Color(r: 255, g: 255, b: 255),
            neutralBackground: Color(r: 31, g: 31, b: 31),
            border: Color(r: 0, g: 0, b: 0)
        )
    }
}

/// Predefined blue color scheme sets combining light and dark modes.
extension BruteTheme.ColorSchemeSet {
    /// Blue color scheme set for theme level zero.
    public static var blueZero: BruteTheme.ColorSchemeSet {
        BruteTheme.ColorSchemeSet(
            colors: [
                .light: .blueZeroLight,
                .dark: .blueZeroDark,
            ]
        )
    }

    public static var blueOne: BruteTheme.ColorSchemeSet {
        BruteTheme.ColorSchemeSet(
            colors: [
                .light: .blueOneLight,
                .dark: .blueOneDark,
            ]
        )
    }

    public static var blueTwo: BruteTheme.ColorSchemeSet {
        BruteTheme.ColorSchemeSet(
            colors: [
                .light: .blueTwoLight,
                .dark: .blueTwoDark,
            ]
        )
    }
}

// MARK: - Orange Color Sets

/// Predefined orange color sets for light and dark modes at different theme levels.
extension BruteTheme.ColorSet {

    public static var orangeZeroLight: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 254, g: 235, b: 220),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 251, g: 176, b: 59),
            neutralForeground: Color(r: 0, g: 0, b: 0),
            neutralBackground: Color(r: 255, g: 255, b: 255),
            border: Color(r: 0, g: 0, b: 0),
        )
    }

    public static var orangeZeroDark: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 82, g: 52, b: 28),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 251, g: 176, b: 59),
            neutralForeground: Color(r: 255, g: 255, b: 255),
            neutralBackground: Color(r: 31, g: 31, b: 31),
            border: Color(r: 0, g: 0, b: 0),
        )
    }

    // MARK: Level One
    public static var orangeOneLight: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 255, g: 255, b: 255),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 253, g: 203, b: 110),
            neutralForeground: Color(r: 0, g: 0, b: 0),
            neutralBackground: Color(r: 255, g: 255, b: 255),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    public static var orangeOneDark: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 31, g: 31, b: 31),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 253, g: 203, b: 110),
            neutralForeground: Color(r: 255, g: 255, b: 255),
            neutralBackground: Color(r: 31, g: 31, b: 31),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    // MARK: Level Two
    public static var orangeTwoLight: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 255, g: 247, b: 237),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 252, g: 186, b: 3),
            neutralForeground: Color(r: 0, g: 0, b: 0),
            neutralBackground: Color(r: 255, g: 255, b: 255),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    public static var orangeTwoDark: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 67, g: 42, b: 22),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 252, g: 186, b: 3),
            neutralForeground: Color(r: 255, g: 255, b: 255),
            neutralBackground: Color(r: 31, g: 31, b: 31),
            border: Color(r: 0, g: 0, b: 0)
        )
    }
}

/// Predefined orange color scheme sets combining light and dark modes.
extension BruteTheme.ColorSchemeSet {
    /// Orange color scheme set for theme level zero.
    public static var orangeZero: BruteTheme.ColorSchemeSet {
        BruteTheme.ColorSchemeSet(
            colors: [
                .light: .orangeZeroLight,
                .dark: .orangeZeroDark,
            ]
        )
    }

    public static var orangeOne: BruteTheme.ColorSchemeSet {
        BruteTheme.ColorSchemeSet(
            colors: [
                .light: .orangeOneLight,
                .dark: .orangeOneDark,
            ]
        )
    }

    public static var orangeTwo: BruteTheme.ColorSchemeSet {
        BruteTheme.ColorSchemeSet(
            colors: [
                .light: .orangeTwoLight,
                .dark: .orangeTwoDark,
            ]
        )
    }
}

// MARK: - Green Color Sets

/// Predefined green color sets for light and dark modes at different theme levels.
extension BruteTheme.ColorSet {

    public static var greenZeroLight: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 220, g: 252, b: 231),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 74, g: 222, b: 128),
            neutralForeground: Color(r: 0, g: 0, b: 0),
            neutralBackground: Color(r: 255, g: 255, b: 255),
            border: Color(r: 0, g: 0, b: 0),
        )
    }

    public static var greenZeroDark: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 28, g: 82, b: 46),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 74, g: 222, b: 128),
            neutralForeground: Color(r: 255, g: 255, b: 255),
            neutralBackground: Color(r: 31, g: 31, b: 31),
            border: Color(r: 0, g: 0, b: 0),
        )
    }

    // MARK: Level One
    public static var greenOneLight: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 255, g: 255, b: 255),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 134, g: 239, b: 172),
            neutralForeground: Color(r: 0, g: 0, b: 0),
            neutralBackground: Color(r: 255, g: 255, b: 255),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    public static var greenOneDark: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 31, g: 31, b: 31),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 134, g: 239, b: 172),
            neutralForeground: Color(r: 255, g: 255, b: 255),
            neutralBackground: Color(r: 31, g: 31, b: 31),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    // MARK: Level Two
    public static var greenTwoLight: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 240, g: 253, b: 244),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 74, g: 222, b: 128),
            neutralForeground: Color(r: 0, g: 0, b: 0),
            neutralBackground: Color(r: 255, g: 255, b: 255),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    public static var greenTwoDark: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 20, g: 83, b: 45),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 74, g: 222, b: 128),
            neutralForeground: Color(r: 255, g: 255, b: 255),
            neutralBackground: Color(r: 31, g: 31, b: 31),
            border: Color(r: 0, g: 0, b: 0)
        )
    }
}

/// Predefined green color scheme sets combining light and dark modes.
extension BruteTheme.ColorSchemeSet {
    /// Green color scheme set for theme level zero.
    public static var greenZero: BruteTheme.ColorSchemeSet {
        BruteTheme.ColorSchemeSet(
            colors: [
                .light: .greenZeroLight,
                .dark: .greenZeroDark,
            ]
        )
    }

    public static var greenOne: BruteTheme.ColorSchemeSet {
        BruteTheme.ColorSchemeSet(
            colors: [
                .light: .greenOneLight,
                .dark: .greenOneDark,
            ]
        )
    }

    public static var greenTwo: BruteTheme.ColorSchemeSet {
        BruteTheme.ColorSchemeSet(
            colors: [
                .light: .greenTwoLight,
                .dark: .greenTwoDark,
            ]
        )
    }
}

// MARK: - Magenta Color Sets

/// Predefined magenta color sets for light and dark modes at different theme levels.
extension BruteTheme.ColorSet {

    public static var magentaZeroLight: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 250, g: 232, b: 255),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 232, g: 121, b: 249),
            neutralForeground: Color(r: 0, g: 0, b: 0),
            neutralBackground: Color(r: 255, g: 255, b: 255),
            border: Color(r: 0, g: 0, b: 0),
        )
    }

    public static var magentaZeroDark: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 73, g: 29, b: 82),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 232, g: 121, b: 249),
            neutralForeground: Color(r: 255, g: 255, b: 255),
            neutralBackground: Color(r: 31, g: 31, b: 31),
            border: Color(r: 0, g: 0, b: 0),
        )
    }

    // MARK: Level One
    public static var magentaOneLight: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 255, g: 255, b: 255),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 240, g: 171, b: 252),
            neutralForeground: Color(r: 0, g: 0, b: 0),
            neutralBackground: Color(r: 255, g: 255, b: 255),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    public static var magentaOneDark: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 31, g: 31, b: 31),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 240, g: 171, b: 252),
            neutralForeground: Color(r: 255, g: 255, b: 255),
            neutralBackground: Color(r: 31, g: 31, b: 31),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    // MARK: Level Two
    public static var magentaTwoLight: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 253, g: 244, b: 255),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 217, g: 70, b: 239),
            neutralForeground: Color(r: 0, g: 0, b: 0),
            neutralBackground: Color(r: 255, g: 255, b: 255),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    public static var magentaTwoDark: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 59, g: 23, b: 84),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 217, g: 70, b: 239),
            neutralForeground: Color(r: 255, g: 255, b: 255),
            neutralBackground: Color(r: 31, g: 31, b: 31),
            border: Color(r: 0, g: 0, b: 0)
        )
    }
}

/// Predefined magenta color scheme sets combining light and dark modes.
extension BruteTheme.ColorSchemeSet {
    /// Magenta color scheme set for theme level zero.
    public static var magentaZero: BruteTheme.ColorSchemeSet {
        BruteTheme.ColorSchemeSet(
            colors: [
                .light: .magentaZeroLight,
                .dark: .magentaZeroDark,
            ]
        )
    }

    public static var magentaOne: BruteTheme.ColorSchemeSet {
        BruteTheme.ColorSchemeSet(
            colors: [
                .light: .magentaOneLight,
                .dark: .magentaOneDark,
            ]
        )
    }

    public static var magentaTwo: BruteTheme.ColorSchemeSet {
        BruteTheme.ColorSchemeSet(
            colors: [
                .light: .magentaTwoLight,
                .dark: .magentaTwoDark,
            ]
        )
    }
}

// MARK: - Maroon Color Sets

/// Predefined maroon color sets for light and dark modes at different theme levels.
extension BruteTheme.ColorSet {

    public static var maroonZeroLight: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 254, g: 226, b: 226),
            accentForeground: Color(r: 255, g: 255, b: 255),
            accentBackground: Color(r: 159, g: 18, b: 57),
            neutralForeground: Color(r: 0, g: 0, b: 0),
            neutralBackground: Color(r: 255, g: 255, b: 255),
            border: Color(r: 0, g: 0, b: 0),
        )
    }

    public static var maroonZeroDark: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 76, g: 29, b: 42),
            accentForeground: Color(r: 255, g: 255, b: 255),
            accentBackground: Color(r: 159, g: 18, b: 57),
            neutralForeground: Color(r: 255, g: 255, b: 255),
            neutralBackground: Color(r: 31, g: 31, b: 31),
            border: Color(r: 0, g: 0, b: 0),
        )
    }

    // MARK: Level One
    public static var maroonOneLight: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 255, g: 255, b: 255),
            accentForeground: Color(r: 255, g: 255, b: 255),
            accentBackground: Color(r: 190, g: 18, b: 60),
            neutralForeground: Color(r: 0, g: 0, b: 0),
            neutralBackground: Color(r: 255, g: 255, b: 255),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    public static var maroonOneDark: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 31, g: 31, b: 31),
            accentForeground: Color(r: 255, g: 255, b: 255),
            accentBackground: Color(r: 190, g: 18, b: 60),
            neutralForeground: Color(r: 255, g: 255, b: 255),
            neutralBackground: Color(r: 31, g: 31, b: 31),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    // MARK: Level Two
    public static var maroonTwoLight: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 255, g: 241, b: 242),
            accentForeground: Color(r: 255, g: 255, b: 255),
            accentBackground: Color(r: 136, g: 19, b: 55),
            neutralForeground: Color(r: 0, g: 0, b: 0),
            neutralBackground: Color(r: 255, g: 255, b: 255),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    public static var maroonTwoDark: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 69, g: 26, b: 38),
            accentForeground: Color(r: 255, g: 255, b: 255),
            accentBackground: Color(r: 136, g: 19, b: 55),
            neutralForeground: Color(r: 255, g: 255, b: 255),
            neutralBackground: Color(r: 31, g: 31, b: 31),
            border: Color(r: 0, g: 0, b: 0)
        )
    }
}

/// Predefined maroon color scheme sets combining light and dark modes.
extension BruteTheme.ColorSchemeSet {
    /// Maroon color scheme set for theme level zero.
    public static var maroonZero: BruteTheme.ColorSchemeSet {
        BruteTheme.ColorSchemeSet(
            colors: [
                .light: .maroonZeroLight,
                .dark: .maroonZeroDark,
            ]
        )
    }

    public static var maroonOne: BruteTheme.ColorSchemeSet {
        BruteTheme.ColorSchemeSet(
            colors: [
                .light: .maroonOneLight,
                .dark: .maroonOneDark,
            ]
        )
    }

    public static var maroonTwo: BruteTheme.ColorSchemeSet {
        BruteTheme.ColorSchemeSet(
            colors: [
                .light: .maroonTwoLight,
                .dark: .maroonTwoDark,
            ]
        )
    }
}

// MARK: - Multicolor Color Sets

/// Predefined multicolor sets that cycle through different colors at each theme level.
extension BruteTheme.ColorSet {

    public static var multicolorZeroLight: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 254, g: 235, b: 220),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 251, g: 176, b: 59),
            neutralForeground: Color(r: 0, g: 0, b: 0),
            neutralBackground: Color(r: 255, g: 255, b: 255),
            border: Color(r: 0, g: 0, b: 0),
        )
    }

    public static var multicolorZeroDark: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 82, g: 52, b: 28),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 251, g: 176, b: 59),
            neutralForeground: Color(r: 255, g: 255, b: 255),
            neutralBackground: Color(r: 31, g: 31, b: 31),
            border: Color(r: 0, g: 0, b: 0),
        )
    }

    // MARK: Level One
    public static var multicolorOneLight: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 238, g: 230, b: 254),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 170, g: 133, b: 255),
            neutralForeground: Color(r: 0, g: 0, b: 0),
            neutralBackground: Color(r: 255, g: 255, b: 255),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    public static var multicolorOneDark: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 51, g: 35, b: 82),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 169, g: 133, b: 255),
            neutralForeground: Color(r: 255, g: 255, b: 255),
            neutralBackground: Color(r: 31, g: 31, b: 31),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    // MARK: Level Two
    public static var multicolorTwoLight: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 224, g: 242, b: 254),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 125, g: 211, b: 252),
            neutralForeground: Color(r: 0, g: 0, b: 0),
            neutralBackground: Color(r: 255, g: 255, b: 255),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    public static var multicolorTwoDark: BruteTheme.ColorSet {
        BruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 30, g: 58, b: 82),
            accentForeground: Color(r: 229, g: 229, b: 229),
            accentBackground: Color(r: 125, g: 211, b: 252),
            neutralForeground: Color(r: 255, g: 255, b: 255),
            neutralBackground: Color(r: 31, g: 31, b: 31),
            border: Color(r: 0, g: 0, b: 0)
        )
    }
}

/// Predefined multicolor scheme sets that change colors at each level.
extension BruteTheme.ColorSchemeSet {
    /// Multicolor scheme set for theme level zero (orange tones).
    public static var multicolorZero: BruteTheme.ColorSchemeSet {
        BruteTheme.ColorSchemeSet(
            colors: [
                .light: .multicolorZeroLight,
                .dark: .multicolorZeroDark,
            ]
        )
    }

    public static var multicolorOne: BruteTheme.ColorSchemeSet {
        BruteTheme.ColorSchemeSet(
            colors: [
                .light: .multicolorOneLight,
                .dark: .multicolorOneDark,
            ]
        )
    }

    public static var multicolorTwo: BruteTheme.ColorSchemeSet {
        BruteTheme.ColorSchemeSet(
            colors: [
                .light: .multicolorTwoLight,
                .dark: .multicolorTwoDark,
            ]
        )
    }
}


