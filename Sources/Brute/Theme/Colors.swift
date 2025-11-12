//
//  Colors.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension BruteTheme {
    public struct Colors: Sendable, BruteColorTheme {
        public let background: Color
        public let secondaryBackground: Color
        public let tertiaryBackground: Color

        public let foreground: Color
        public let secondaryForeground: Color
        public let tertiaryForeground: Color

        public let border: Color

        public func colors(for scheme: ColorScheme) -> Colors {
            self
        }
    }
}

// MARK: - Default Colors
extension BruteTheme.Colors {
    public static var `default`: BruteTheme.Colors { violet }

    public static let violet = BruteTheme.Colors(
        background: Color(r: 238, g: 230, b: 254),
        secondaryBackground: Color(r: 170, g: 133, b: 255),
        tertiaryBackground: Color(r: 255, g: 255, b: 255),

        foreground: Color(r: 0, g: 0, b: 0),
        secondaryForeground: Color(r: 0, g: 0, b: 0),
        tertiaryForeground: Color(r: 0, g: 0, b: 0),

        border: Color(r: 0, g: 0, b: 0)
    )

    public static let violetDark = BruteTheme.Colors(
        background: Color(r: 51, g: 35, b: 82),
        secondaryBackground: Color(r: 169, g: 133, b: 255),
        tertiaryBackground: Color(r: 31, g: 31, b: 31),

        foreground: Color(r: 229, g: 229, b: 229),
        secondaryForeground: Color(r: 0, g: 0, b: 0),
        tertiaryForeground: Color(r: 229, g: 229, b: 229),

        border: Color(r: 0, g: 0, b: 0)
    )

    public static let blue = BruteTheme.Colors(
        background: Color(r: 224, g: 242, b: 254),
        secondaryBackground: Color(r: 125, g: 211, b: 252),
        tertiaryBackground: Color(r: 255, g: 255, b: 255),

        foreground: Color(r: 0, g: 0, b: 0),
        secondaryForeground: Color(r: 0, g: 0, b: 0),
        tertiaryForeground: Color(r: 0, g: 0, b: 0),

        border: Color(r: 0, g: 0, b: 0)
    )

    public static let blueDark = BruteTheme.Colors(
        background: Color(r: 30, g: 58, b: 82),
        secondaryBackground: Color(r: 125, g: 211, b: 252),
        tertiaryBackground: Color(r: 31, g: 31, b: 31),

        foreground: Color(r: 229, g: 229, b: 229),
        secondaryForeground: Color(r: 0, g: 0, b: 0),
        tertiaryForeground: Color(r: 229, g: 229, b: 229),

        border: Color(r: 229, g: 229, b: 229)
    )

    public static let orange = BruteTheme.Colors(
        background: Color(r: 254, g: 235, b: 220),
        secondaryBackground: Color(r: 251, g: 176, b: 59),
        tertiaryBackground: Color(r: 255, g: 255, b: 255),

        foreground: Color(r: 0, g: 0, b: 0),
        secondaryForeground: Color(r: 0, g: 0, b: 0),
        tertiaryForeground: Color(r: 0, g: 0, b: 0),

        border: Color(r: 0, g: 0, b: 0)
    )

    public static let orangeDark = BruteTheme.Colors(
        background: Color(r: 82, g: 52, b: 28),
        secondaryBackground: Color(r: 251, g: 176, b: 59),
        tertiaryBackground: Color(r: 31, g: 31, b: 31),

        foreground: Color(r: 229, g: 229, b: 229),
        secondaryForeground: Color(r: 0, g: 0, b: 0),
        tertiaryForeground: Color(r: 229, g: 229, b: 229),

        border: Color(r: 0, g: 0, b: 0)
    )

    public static let green = BruteTheme.Colors(
        background: Color(r: 220, g: 252, b: 231),
        secondaryBackground: Color(r: 74, g: 222, b: 128),
        tertiaryBackground: Color(r: 255, g: 255, b: 255),

        foreground: Color(r: 0, g: 0, b: 0),
        secondaryForeground: Color(r: 0, g: 0, b: 0),
        tertiaryForeground: Color(r: 0, g: 0, b: 0),

        border: Color(r: 0, g: 0, b: 0)
    )

    public static let greenDark = BruteTheme.Colors(
        background: Color(r: 28, g: 82, b: 46),
        secondaryBackground: Color(r: 74, g: 222, b: 128),
        tertiaryBackground: Color(r: 31, g: 31, b: 31),

        foreground: Color(r: 229, g: 229, b: 229),
        secondaryForeground: Color(r: 0, g: 0, b: 0),
        tertiaryForeground: Color(r: 229, g: 229, b: 229),

        border: Color(r: 0, g: 0, b: 0)
    )
}

// MARK: - Copy
extension BruteTheme.Colors {
    func copy(
        background: Color? = nil,
        secondaryBackground: Color? = nil,
        tertiaryBackground: Color? = nil,
        foreground: Color? = nil,
        secondaryForeground: Color? = nil,
        tertiaryForeground: Color? = nil,
        border: Color? = nil
    ) -> BruteTheme.Colors {
        BruteTheme.Colors(
            background: background ?? self.background,
            secondaryBackground: secondaryBackground ?? self.secondaryBackground,
            tertiaryBackground: tertiaryBackground ?? self.tertiaryBackground,
            foreground: foreground ?? self.foreground,
            secondaryForeground: secondaryForeground ?? self.secondaryForeground,
            tertiaryForeground: tertiaryForeground ?? self.tertiaryForeground,
            border: border ?? self.border
        )
    }
}
