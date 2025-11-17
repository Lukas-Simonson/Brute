//
//  BruteContext.swift
//  Brute
//
//  Created by Lukas Simonson on 11/13/25.
//

import SwiftUI

extension EnvironmentValues {
    /// The current Brute theme applied to the view hierarchy.
    ///
    /// Defaults to `.violet`. Can be overridden using the `bruteTheme(_:)` modifier.
    @Entry public var bruteTheme: BruteTheme = .violet

    /// Optional override for the color set, bypassing the theme's default colors.
    @Entry var bruteColorSetOverride: BruteTheme.ColorSet? = nil

    /// Optional override for the dimension set, bypassing the theme's default dimensions.
    @Entry var bruteDimensionSetOverride: BruteTheme.DimensionSet? = nil

    /// Optional override for the font set, bypassing the theme's default fonts.
    @Entry var bruteFontSetOverride: BruteTheme.FontSet? = nil

    /// Computed property that provides the resolved theme context.
    ///
    /// Returns a `BruteContext` with the current color, dimension, and font sets,
    /// considering any overrides that have been applied.
    public var bruteContext: BruteContext {
        BruteContext(
            color: bruteColorSetOverride ?? bruteTheme.color(for: colorScheme),
            dimen: bruteDimensionSetOverride ?? bruteTheme.dimen,
            font: bruteFontSetOverride ?? bruteTheme.font
        )
    }
}

/// A resolved theme context containing the active color, dimension, and font sets.
///
/// `BruteContext` provides convenient access to all theming values in a single object.
/// Access it through the environment to apply consistent styling across your views.
///
/// ## Usage
///
/// ```swift
/// @Environment(\.bruteContext) var theme
///
/// VStack {
///     Text("Title")
///         .font(theme.font.title)
///         .foregroundColor(theme.color.foreground)
///         .padding(theme.dimen.paddingMedium)
/// }
/// .background(theme.color.background)
/// .cornerRadius(theme.dimen.cornerRadius)
/// ```
public struct BruteContext {
    /// The resolved color set for the current theme and color scheme.
    public let color: BruteTheme.ColorSet

    /// The resolved dimension set for the current theme level.
    public let dimen: BruteTheme.DimensionSet

    /// The resolved font set for the current theme level.
    public let font: BruteTheme.FontSet
}

// MARK: - View Modifiers

extension View {
    /// Adjusts the theme level by the specified amount for child views.
    ///
    /// Use this to create nested visual hierarchies where child elements automatically
    /// receive different styling based on their depth.
    ///
    /// - Parameter change: The amount to adjust the theme level (can be positive or negative).
    /// - Returns: A view with the adjusted theme level applied to its environment.
    ///
    /// ## Example
    ///
    /// ```swift
    /// VStack {
    ///     Text("Level 0")
    ///     VStack {
    ///         Text("Level 1")
    ///     }
    ///     .bruteThemeLeveled(by: 1)
    /// }
    /// ```
    public func bruteThemeLeveled(by change: Int) -> some View {
        self.modifier(ThemeLeveledViewModifier(change: change))
    }

    /// Sets the Brute theme for the view hierarchy.
    ///
    /// Apply this modifier to change the active theme for a view and its children.
    ///
    /// - Parameter theme: The theme to apply (e.g., `.violet`, `.blue`, `.orange`).
    /// - Returns: A view with the specified theme applied to its environment.
    ///
    /// ## Example
    ///
    /// ```swift
    /// ContentView()
    ///     .bruteTheme(.violet)
    /// ```
    public func bruteTheme(_ theme: BruteTheme) -> some View {
        self.environment(\.bruteTheme, theme)
    }

    /// Overrides the color set for the view hierarchy.
    ///
    /// Use this to apply custom colors while keeping the theme's dimensions and fonts.
    ///
    /// - Parameter set: The color set to use, or `nil` to remove the override.
    /// - Returns: A view with the color override applied to its environment.
    public func overrideBruteColor(_ set: BruteTheme.ColorSet?) -> some View {
        self.environment(\.bruteColorSetOverride, set)
    }

    /// Overrides the dimension set for the view hierarchy.
    ///
    /// Use this to apply custom dimensions while keeping the theme's colors and fonts.
    ///
    /// - Parameter set: The dimension set to use, or `nil` to remove the override.
    /// - Returns: A view with the dimension override applied to its environment.
    public func overrideBruteDimen(_ set: BruteTheme.DimensionSet?) -> some View {
        self.environment(\.bruteDimensionSetOverride, set)
    }

    /// Overrides the font set for the view hierarchy.
    ///
    /// Use this to apply custom fonts while keeping the theme's colors and dimensions.
    ///
    /// - Parameter set: The font set to use, or `nil` to remove the override.
    /// - Returns: A view with the font override applied to its environment.
    public func overrideBruteFont(_ set: BruteTheme.FontSet?) -> some View {
        self.environment(\.bruteFontSetOverride, set)
    }
}

fileprivate struct ThemeLeveledViewModifier: ViewModifier {
    @Environment(\.bruteTheme) private var theme

    let change: Int

    func body(content: Content) -> some View {
        content
            .environment(\.bruteTheme, theme.leveled(by: change))
    }
}
