//
//  TieredBruteTheme.swift
//  Brute
//
//  Created by Lukas Simonson on 11/13/25.
//

import SwiftUI

/// A comprehensive theming system that supports multi-level styling with colors, dimensions, and fonts.
///
/// `BruteTheme` provides a flexible theming architecture that allows for hierarchical styling through levels.
/// Each theme contains arrays of color schemes, dimension sets, and font sets that can be accessed based on
/// the current level, enabling nested UI components to automatically adjust their styling.
///
/// ## Usage
///
/// Apply a theme to your view hierarchy using the `bruteTheme(_:)` modifier:
///
/// ```swift
/// ContentView()
///     .bruteTheme(.violet)
/// ```
///
/// Access theme values through the environment:
///
/// ```swift
/// @Environment(\.bruteContext) var theme
/// ```
///
/// ## Levels
///
/// Themes support multiple levels (0, 1, 2, etc.) that allow nested components to use different styling.
/// Use `bruteThemeLeveled(by:)` to adjust the theme level for child views:
///
/// ```swift
/// ChildView()
///     .bruteThemeLeveled(by: 1) // Increases level by 1
/// ```
public struct BruteTheme {
    /// The current hierarchical level of this theme (0-indexed).
    let level: Int

    /// Array of color scheme sets for different theme levels.
    private let colors: [ColorSchemeSet]

    /// Array of dimension sets for different theme levels.
    private let dimensions: [DimensionSet]

    /// Array of font sets for different theme levels.
    private let fonts: [FontSet]

    /// Creates a new BruteTheme with the specified styling sets.
    ///
    /// - Parameters:
    ///   - level: The starting level for this theme (default: 0).
    ///   - colors: Array of color scheme sets. Must contain at least one set.
    ///   - dimensions: Array of dimension sets. Must contain at least one set.
    ///   - fonts: Array of font sets. Must contain at least one set.
    ///
    /// - Precondition: All arrays must contain at least one element.
    public init(level: Int = 0, colors: [ColorSchemeSet], dimensions: [DimensionSet], fonts: [FontSet]) {
        assert(colors.count >= 1, "BruteTheme must include at least one `ColorSet`")
        assert(dimensions.count >= 1, "BruteTheme must include at least one `DimensionSet`")
        assert(fonts.count >= 1, "BruteTheme must include at least one `FontSet`")

        self.level = level
        self.colors = colors
        self.dimensions = dimensions
        self.fonts = fonts
    }

    /// The dimension set for the current theme level.
    public var dimen: DimensionSet { dimen(for: level) }

    /// The font set for the current theme level.
    public var font: FontSet { font(for: level) }

    /// Returns the color set for the current level and specified color scheme.
    ///
    /// - Parameter scheme: The color scheme (light or dark) to retrieve colors for.
    /// - Returns: The appropriate color set for the current level and scheme.
    public func color(for scheme: ColorScheme) -> ColorSet {
        color(for: level, scheme: scheme)
    }

    /// Returns the color set for a specific level and color scheme.
    ///
    /// If the requested level exceeds the available color sets, returns the last available set.
    ///
    /// - Parameters:
    ///   - level: The theme level to retrieve colors for.
    ///   - scheme: The color scheme (light or dark) to retrieve colors for.
    /// - Returns: The appropriate color set for the specified level and scheme.
    public func color(for level: Int, scheme: ColorScheme) -> ColorSet {
        guard level < colors.count else { return colors.last!.color(for: scheme) }
        return colors[level].color(for: scheme)
    }

    /// Returns the dimension set for a specific theme level.
    ///
    /// If the requested level exceeds the available dimension sets, returns the last available set.
    ///
    /// - Parameter level: The theme level to retrieve dimensions for.
    /// - Returns: The dimension set for the specified level.
    public func dimen(for level: Int) -> DimensionSet {
        guard level < dimensions.count else { return dimensions.last! }
        return dimensions[level]
    }

    /// Returns the font set for a specific theme level.
    ///
    /// If the requested level exceeds the available font sets, returns the last available set.
    ///
    /// - Parameter level: The theme level to retrieve fonts for.
    /// - Returns: The font set for the specified level.
    public func font(for level: Int) -> FontSet {
        guard level < fonts.count else { return fonts.last! }
        return fonts[level]
    }

    /// Creates a new theme instance with an adjusted level.
    ///
    /// Use this to create nested theme contexts. The resulting level is clamped to a minimum of 0.
    ///
    /// - Parameter amount: The amount to adjust the current level by (can be negative).
    /// - Returns: A new BruteTheme instance with the adjusted level.
    public func leveled(by amount: Int) -> BruteTheme {
        BruteTheme(level: max(0, level + amount), colors: colors, dimensions: dimensions, fonts: fonts)
    }
}

// MARK: - Predefined Themes

extension BruteTheme {
    /// A violet-themed style with purple hues and soft shadows.
    ///
    /// Features three color levels (zero, one, two) with rounded corners and consistent padding.
    public static var violet: BruteTheme {
        BruteTheme(
            colors: [.violetZero, .violetOne, .violetTwo],
            dimensions: [.violet],
            fonts: [.violet]
        )
    }

    /// A blue-themed style with sky blue colors and sharp rectangular shapes.
    ///
    /// Features three color levels with no corner radius and upward shadows.
    public static var blue: BruteTheme {
        BruteTheme(
            colors: [.blueZero, .blueOne, .blueTwo],
            dimensions: [.blue],
            fonts: [.violet]
        )
    }

    /// An orange-themed style with warm, vibrant colors.
    ///
    /// Features three color levels with rounded corners and offset shadows.
    public static var orange: BruteTheme {
        BruteTheme(
            colors: [.orangeZero, .orangeOne, .orangeTwo],
            dimensions: [.orange],
            fonts: [.violet]
        )
    }

    /// A green-themed style with fresh, natural colors.
    ///
    /// Features three color levels with medium rounded corners and downward shadows.
    public static var green: BruteTheme {
        BruteTheme(
            colors: [.greenZero, .greenOne, .greenTwo],
            dimensions: [.green],
            fonts: [.violet]
        )
    }

    /// A magenta-themed style with vibrant pink-purple colors.
    ///
    /// Features three color levels with rounded corners and prominent shadows.
    public static var magenta: BruteTheme {
        BruteTheme(
            colors: [.magentaZero, .magentaOne, .magentaTwo],
            dimensions: [.magenta],
            fonts: [.violet]
        )
    }

    /// A maroon-themed style with deep red colors and white accent text.
    ///
    /// Features three color levels with highly rounded corners and upward shadows.
    public static var maroon: BruteTheme {
        BruteTheme(
            colors: [.maroonZero, .maroonOne, .maroonTwo],
            dimensions: [.maroon],
            fonts: [.violet]
        )
    }

    /// A multicolor theme that cycles through different colors at each level.
    ///
    /// Features orange at level zero, violet at level one, and blue at level two.
    public static var multi: BruteTheme {
        BruteTheme(
            colors: [.multicolorZero, .multicolorOne, .multicolorTwo],
            dimensions: [.violet],
            fonts: [.violet]
        )
    }
}
