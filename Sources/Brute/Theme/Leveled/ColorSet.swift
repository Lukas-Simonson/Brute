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

// MARK: - Blue
extension LeveledBruteTheme.ColorSet {
    
    public static var blueZeroLight: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 224, g: 242, b: 254),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 125, g: 211, b: 252),
            border: Color(r: 0, g: 0, b: 0),
        )
    }

    public static var blueZeroDark: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 30, g: 58, b: 82),
            accentForeground: Color(r: 229, g: 229, b: 229),
            accentBackground: Color(r: 125, g: 211, b: 252),
            border: Color(r: 0, g: 0, b: 0),
        )
    }

    // MARK: Level One
    public static var blueOneLight: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 255, g: 255, b: 255),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 186, g: 230, b: 253),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    public static var blueOneDark: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 31, g: 31, b: 31),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 186, g: 230, b: 253),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    // MARK: Level Two
    public static var blueTwoLight: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 240, g: 249, b: 255),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 147, g: 197, b: 253),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    public static var blueTwoDark: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 23, g: 37, b: 84),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 147, g: 197, b: 253),
            border: Color(r: 0, g: 0, b: 0)
        )
    }
}

extension LeveledBruteTheme.ColorSchemeSet {
    public static var blueZero: LeveledBruteTheme.ColorSchemeSet {
        LeveledBruteTheme.ColorSchemeSet(
            colors: [
                .light: .blueZeroLight,
                .dark: .blueZeroDark,
            ]
        )
    }

    public static var blueOne: LeveledBruteTheme.ColorSchemeSet {
        LeveledBruteTheme.ColorSchemeSet(
            colors: [
                .light: .blueOneLight,
                .dark: .blueOneDark,
            ]
        )
    }

    public static var blueTwo: LeveledBruteTheme.ColorSchemeSet {
        LeveledBruteTheme.ColorSchemeSet(
            colors: [
                .light: .blueTwoLight,
                .dark: .blueTwoDark,
            ]
        )
    }
}

// MARK: - Orange
extension LeveledBruteTheme.ColorSet {

    public static var orangeZeroLight: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 254, g: 235, b: 220),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 251, g: 176, b: 59),
            border: Color(r: 0, g: 0, b: 0),
        )
    }

    public static var orangeZeroDark: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 82, g: 52, b: 28),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 251, g: 176, b: 59),
            border: Color(r: 0, g: 0, b: 0),
        )
    }

    // MARK: Level One
    public static var orangeOneLight: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 255, g: 255, b: 255),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 253, g: 203, b: 110),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    public static var orangeOneDark: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 31, g: 31, b: 31),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 253, g: 203, b: 110),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    // MARK: Level Two
    public static var orangeTwoLight: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 255, g: 247, b: 237),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 252, g: 186, b: 3),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    public static var orangeTwoDark: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 67, g: 42, b: 22),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 252, g: 186, b: 3),
            border: Color(r: 0, g: 0, b: 0)
        )
    }
}

extension LeveledBruteTheme.ColorSchemeSet {
    public static var orangeZero: LeveledBruteTheme.ColorSchemeSet {
        LeveledBruteTheme.ColorSchemeSet(
            colors: [
                .light: .orangeZeroLight,
                .dark: .orangeZeroDark,
            ]
        )
    }

    public static var orangeOne: LeveledBruteTheme.ColorSchemeSet {
        LeveledBruteTheme.ColorSchemeSet(
            colors: [
                .light: .orangeOneLight,
                .dark: .orangeOneDark,
            ]
        )
    }

    public static var orangeTwo: LeveledBruteTheme.ColorSchemeSet {
        LeveledBruteTheme.ColorSchemeSet(
            colors: [
                .light: .orangeTwoLight,
                .dark: .orangeTwoDark,
            ]
        )
    }
}

// MARK: - Green
extension LeveledBruteTheme.ColorSet {

    public static var greenZeroLight: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 220, g: 252, b: 231),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 74, g: 222, b: 128),
            border: Color(r: 0, g: 0, b: 0),
        )
    }

    public static var greenZeroDark: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 28, g: 82, b: 46),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 74, g: 222, b: 128),
            border: Color(r: 0, g: 0, b: 0),
        )
    }

    // MARK: Level One
    public static var greenOneLight: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 255, g: 255, b: 255),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 134, g: 239, b: 172),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    public static var greenOneDark: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 31, g: 31, b: 31),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 134, g: 239, b: 172),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    // MARK: Level Two
    public static var greenTwoLight: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 240, g: 253, b: 244),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 74, g: 222, b: 128),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    public static var greenTwoDark: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 20, g: 83, b: 45),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 74, g: 222, b: 128),
            border: Color(r: 0, g: 0, b: 0)
        )
    }
}

extension LeveledBruteTheme.ColorSchemeSet {
    public static var greenZero: LeveledBruteTheme.ColorSchemeSet {
        LeveledBruteTheme.ColorSchemeSet(
            colors: [
                .light: .greenZeroLight,
                .dark: .greenZeroDark,
            ]
        )
    }

    public static var greenOne: LeveledBruteTheme.ColorSchemeSet {
        LeveledBruteTheme.ColorSchemeSet(
            colors: [
                .light: .greenOneLight,
                .dark: .greenOneDark,
            ]
        )
    }

    public static var greenTwo: LeveledBruteTheme.ColorSchemeSet {
        LeveledBruteTheme.ColorSchemeSet(
            colors: [
                .light: .greenTwoLight,
                .dark: .greenTwoDark,
            ]
        )
    }
}

// MARK: - Multicolor
extension LeveledBruteTheme.ColorSet {

    public static var multicolorZeroLight: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 254, g: 235, b: 220),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 251, g: 176, b: 59),
            border: Color(r: 0, g: 0, b: 0),
        )
    }

    public static var multicolorZeroDark: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 82, g: 52, b: 28),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 251, g: 176, b: 59),
            border: Color(r: 0, g: 0, b: 0),
        )
    }

    // MARK: Level One
    public static var multicolorOneLight: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 238, g: 230, b: 254),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 170, g: 133, b: 255),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    public static var multicolorOneDark: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 51, g: 35, b: 82),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 169, g: 133, b: 255),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    // MARK: Level Two
    public static var multicolorTwoLight: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 0, g: 0, b: 0),
            background: Color(r: 224, g: 242, b: 254),
            accentForeground: Color(r: 0, g: 0, b: 0),
            accentBackground: Color(r: 125, g: 211, b: 252),
            border: Color(r: 0, g: 0, b: 0)
        )
    }

    public static var multicolorTwoDark: LeveledBruteTheme.ColorSet {
        LeveledBruteTheme.ColorSet(
            foreground: Color(r: 229, g: 229, b: 229),
            background: Color(r: 30, g: 58, b: 82),
            accentForeground: Color(r: 229, g: 229, b: 229),
            accentBackground: Color(r: 125, g: 211, b: 252),
            border: Color(r: 0, g: 0, b: 0)
        )
    }
}

extension LeveledBruteTheme.ColorSchemeSet {
    public static var multicolorZero: LeveledBruteTheme.ColorSchemeSet {
        LeveledBruteTheme.ColorSchemeSet(
            colors: [
                .light: .multicolorZeroLight,
                .dark: .multicolorZeroDark,
            ]
        )
    }

    public static var multicolorOne: LeveledBruteTheme.ColorSchemeSet {
        LeveledBruteTheme.ColorSchemeSet(
            colors: [
                .light: .multicolorOneLight,
                .dark: .multicolorOneDark,
            ]
        )
    }

    public static var multicolorTwo: LeveledBruteTheme.ColorSchemeSet {
        LeveledBruteTheme.ColorSchemeSet(
            colors: [
                .light: .multicolorTwoLight,
                .dark: .multicolorTwoDark,
            ]
        )
    }
}


