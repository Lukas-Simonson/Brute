//
//  ColorSet.swift
//  Brute
//
//  Created by Lukas Simonson on 11/13/25.
//

import SwiftUI

extension LeveledBruteTheme {
    public struct ColorSet {
        public let foreground: Color
        public let background: Color

        public let accentForeground: Color
        public let accentBackground: Color

        public let border: Color
    }

    public struct ColorSchemeSet {
        private let colors: [ColorScheme: ColorSet]

        public init(colors: [ColorScheme: ColorSet]) {
            assert(colors.keys.contains(.light), "ColorSchemeSet must include the `light` scheme.")
            self.colors = colors
        }

        func color(for scheme: ColorScheme) -> ColorSet {
            return colors[scheme] ?? colors[.light]!
        }
    }
}

// MARK: - Violet
extension LeveledBruteTheme.ColorSet {
    public static var violetZeroLight: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 238, g: 230, b: 254),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 170, g: 133, b: 255),
            border: Color(r: 0, g: 0, b: 0),
        )
    }

    public static var violetZeroDark: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 51, g: 35, b: 82),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 169, g: 133, b: 255),
            border: Color(r: 0, g: 0, b: 0),
        )
    }

    // MARK: Level One
    public static var violetOneLight: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 255, g: 255, b: 255),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 206, g: 183, b: 255),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    public static var violetOneDark: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 31, g: 31, b: 31),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 206, g: 183, b: 255),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    // MARK: Level Two
    public static var violetTwoLight: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 248, g: 245, b: 255),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 188, g: 158, b: 255),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    public static var violetTwoDark: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 41, g: 28, b: 66),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 188, g: 158, b: 255),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

}

extension LeveledBruteTheme.ColorSchemeSet {
    public static var violetZero: LeveledBruteTheme.ColorSchemeSet {
        LeveledBruteTheme.ColorSchemeSet(
            colors: [
                .light: .violetZeroLight,
                .dark: .violetZeroDark,
            ]
        )
    }

    public static var violetOne: LeveledBruteTheme.ColorSchemeSet {
        LeveledBruteTheme.ColorSchemeSet(
            colors: [
                .light: .violetOneLight,
                .dark: .violetOneDark,
            ]
        )
    }

    public static var violetTwo: LeveledBruteTheme.ColorSchemeSet {
        LeveledBruteTheme.ColorSchemeSet(
            colors: [
                .light: .violetTwoLight,
                .dark: .violetTwoDark,
            ]
        )
    }
}

//public static let violet = BruteTheme.Colors(
//    background: Color(r: 238, g: 230, b: 254),
//    secondaryBackground: Color(r: 170, g: 133, b: 255),
//    tertiaryBackground: Color(r: 255, g: 255, b: 255),
//
//    foreground: Color(r: 0, g: 0, b: 0),
//    secondaryForeground: Color(r: 0, g: 0, b: 0),
//    tertiaryForeground: Color(r: 0, g: 0, b: 0),
//
//    border: Color(r: 0, g: 0, b: 0)
//)
//
//public static let violetDark = BruteTheme.Colors(
//    background: Color(r: 51, g: 35, b: 82),
//    secondaryBackground: Color(r: 169, g: 133, b: 255),
//    tertiaryBackground: Color(r: 31, g: 31, b: 31),
//
//    foreground: Color(r: 229, g: 229, b: 229),
//    secondaryForeground: Color(r: 0, g: 0, b: 0),
//    tertiaryForeground: Color(r: 229, g: 229, b: 229),
//
//    border: Color(r: 0, g: 0, b: 0)
//    )
