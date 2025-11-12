//
//  Colors.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension BruteTheme {
    public struct Colors: Sendable {
        let background: Color
        let secondaryBackground: Color
        let tertiaryBackground: Color

        let foreground: Color
        let secondaryForeground: Color
        let tertiaryForeground: Color

        let border: Color
    }
}

extension BruteTheme.Colors {
    public static let `default` = BruteTheme.Colors(
        background: Color(r: 238, g: 230, b: 254),
        secondaryBackground: Color(r: 170, g: 133, b: 255),
        tertiaryBackground: Color(r: 255, g: 255, b: 255),

        foreground: Color(r: 0, g: 0, b: 0),
        secondaryForeground: Color(r: 0, g: 0, b: 0),
        tertiaryForeground: Color(r: 0, g: 0, b: 0),

        border: Color(r: 0, g: 0, b: 0)
    )
}
