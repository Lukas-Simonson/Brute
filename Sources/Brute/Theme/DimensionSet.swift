//
//  DimensionSet.swift
//  Brute
//
//  Created by Lukas Simonson on 11/13/25.
//

import SwiftUI

extension BruteTheme {
    /// A set of dimensional values defining layout and styling metrics for a theme.
    ///
    /// `DimensionSet` provides consistent spacing, sizing, and styling values that work together
    /// to create a cohesive visual design. Use these values for corner radii, shadows, borders,
    /// and padding throughout your interface.
    ///
    /// ## Usage
    ///
    /// Access dimensions from the current theme context:
    ///
    /// ```swift
    /// @Environment(\.bruteContext) var theme
    ///
    /// RoundedRectangle(cornerRadius: theme.dimen.cornerRadius)
    ///     .stroke(lineWidth: theme.dimen.borderWidth)
    ///     .padding(theme.dimen.paddingMedium)
    /// ```
    public struct DimensionSet {
        /// Corner radius for rounded elements.
        public let cornerRadius: CGFloat

        /// Shadow offset for drop shadows (width and height).
        public let shadowOffset: CGSize

        /// Width of borders and strokes.
        public let borderWidth: CGFloat

        /// Small padding value for tight spacing.
        public let paddingSmall: CGFloat

        /// Medium padding value for standard spacing.
        public let paddingMedium: CGFloat

        /// Large padding value for generous spacing.
        public let paddingLarge: CGFloat
    }
}

// MARK: - Predefined Dimension Sets

extension BruteTheme.DimensionSet {
    /// Violet theme dimensions with soft rounded corners and diagonal shadows.
    ///
    /// - Corner radius: 5.0
    /// - Shadow offset: (4.0, 4.0)
    /// - Border width: 2.0
    public static var violet: BruteTheme.DimensionSet {
        BruteTheme.DimensionSet(
            cornerRadius: 5.0,
            shadowOffset: CGSize(width: 4.0, height: 4.0),
            borderWidth: 2.0,

            paddingSmall: 8.0,
            paddingMedium: 16.0,
            paddingLarge: 32.0
        )
    }

    /// Blue theme dimensions with sharp rectangular shapes and upward shadows.
    ///
    /// - Corner radius: 0.0 (no rounding)
    /// - Shadow offset: (4.0, -4.0)
    /// - Border width: 2.0
    public static var blue: BruteTheme.DimensionSet {
        BruteTheme.DimensionSet(
            cornerRadius: 0.0,
            shadowOffset: CGSize(width: 4.0, height: -4.0),
            borderWidth: 2.0,

            paddingSmall: 8.0,
            paddingMedium: 16.0,
            paddingLarge: 32.0
        )
    }

    /// Orange theme dimensions with rounded corners and offset shadows.
    ///
    /// - Corner radius: 10.0
    /// - Shadow offset: (-4.0, -4.0)
    /// - Border width: 2.0
    public static var orange: BruteTheme.DimensionSet {
        BruteTheme.DimensionSet(
            cornerRadius: 10.0,
            shadowOffset: CGSize(width: -4.0, height: -4.0),
            borderWidth: 2.0,

            paddingSmall: 8.0,
            paddingMedium: 16.0,
            paddingLarge: 32.0
        )
    }

    /// Magenta theme dimensions with rounded corners and prominent shadows.
    ///
    /// - Corner radius: 10.0
    /// - Shadow offset: (5.0, 5.0)
    /// - Border width: 2.0
    public static var magenta: BruteTheme.DimensionSet {
        BruteTheme.DimensionSet(
            cornerRadius: 10.0,
            shadowOffset: CGSize(width: 5.0, height: 5.0),
            borderWidth: 2.0,

            paddingSmall: 8.0,
            paddingMedium: 16.0,
            paddingLarge: 32.0
        )
    }

    /// Maroon theme dimensions with highly rounded corners and upward shadows.
    ///
    /// - Corner radius: 20.0
    /// - Shadow offset: (0.0, -4.0)
    /// - Border width: 2.0
    public static var maroon: BruteTheme.DimensionSet {
        BruteTheme.DimensionSet(
            cornerRadius: 20.0,
            shadowOffset: CGSize(width: 0, height: -4.0),
            borderWidth: 2.0,

            paddingSmall: 8.0,
            paddingMedium: 16.0,
            paddingLarge: 32.0
        )
    }

    /// Green theme dimensions with medium rounded corners and downward shadows.
    ///
    /// - Corner radius: 15.0
    /// - Shadow offset: (0.0, 4.0)
    /// - Border width: 2.0
    public static var green: BruteTheme.DimensionSet {
        BruteTheme.DimensionSet(
            cornerRadius: 15.0,
            shadowOffset: CGSize(width: 0, height: 4.0),
            borderWidth: 2.0,

            paddingSmall: 8.0,
            paddingMedium: 16.0,
            paddingLarge: 32.0
        )
    }
}
