//
//  ColorSet.swift
//  Brute
//
//  Created by Lukas Simonson on 11/13/25.
//

import SwiftUI

extension BruteTheme {
    public struct ColorSet {
        public let foreground: Color
        public let background: Color

        public let accentForeground: Color
        public let accentBackground: Color

        public let neutralForeground: Color
        public let neutralBackground: Color

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
extension BruteTheme.ColorSet {
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
            neutralBackground: Color(r: 0, g: 0, b: 0),
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
            neutralBackground: Color(r: 0, g: 0, b: 0),
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
            neutralBackground: Color(r: 0, g: 0, b: 0),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

}

extension BruteTheme.ColorSchemeSet {
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

// MARK: - Blue
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
            neutralBackground: Color(r: 0, g: 0, b: 0),
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
            neutralBackground: Color(r: 0, g: 0, b: 0),
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
            neutralBackground: Color(r: 0, g: 0, b: 0),
            border: Color(r: 0, g: 0, b: 0)
        )
    }
}

extension BruteTheme.ColorSchemeSet {
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

// MARK: - Orange
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
            neutralBackground: Color(r: 0, g: 0, b: 0),
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
            neutralBackground: Color(r: 0, g: 0, b: 0),
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
            neutralBackground: Color(r: 0, g: 0, b: 0),
            border: Color(r: 0, g: 0, b: 0)
        )
    }
}

extension BruteTheme.ColorSchemeSet {
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

// MARK: - Green
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
            neutralBackground: Color(r: 0, g: 0, b: 0),
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
            neutralBackground: Color(r: 0, g: 0, b: 0),
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
            neutralBackground: Color(r: 0, g: 0, b: 0),
            border: Color(r: 0, g: 0, b: 0)
        )
    }
}

extension BruteTheme.ColorSchemeSet {
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

// MARK: - Multicolor
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
            neutralBackground: Color(r: 0, g: 0, b: 0),
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
            neutralBackground: Color(r: 0, g: 0, b: 0),
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
            neutralBackground: Color(r: 0, g: 0, b: 0),
            border: Color(r: 0, g: 0, b: 0)
        )
    }
}

extension BruteTheme.ColorSchemeSet {
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


