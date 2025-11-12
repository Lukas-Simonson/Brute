//
//  Colors.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension BruteTheme {
    public struct Colors: Sendable {
        public let background: Color
        public let secondaryBackground: Color
        public let tertiaryBackground: Color

        public let foreground: Color
        public let secondaryForeground: Color
        public let tertiaryForeground: Color

        public let border: Color
    }
}

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

    public static let blue = BruteTheme.Colors(
        background: Color(r: 224, g: 242, b: 254),
        secondaryBackground: Color(r: 125, g: 211, b: 252),
        tertiaryBackground: Color(r: 255, g: 255, b: 255),

        foreground: Color(r: 0, g: 0, b: 0),
        secondaryForeground: Color(r: 0, g: 0, b: 0),
        tertiaryForeground: Color(r: 0, g: 0, b: 0),

        border: Color(r: 0, g: 0, b: 0)
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

    public static let green = BruteTheme.Colors(
        background: Color(r: 220, g: 252, b: 231),
        secondaryBackground: Color(r: 74, g: 222, b: 128),
        tertiaryBackground: Color(r: 255, g: 255, b: 255),

        foreground: Color(r: 0, g: 0, b: 0),
        secondaryForeground: Color(r: 0, g: 0, b: 0),
        tertiaryForeground: Color(r: 0, g: 0, b: 0),

        border: Color(r: 0, g: 0, b: 0)
    )
}
