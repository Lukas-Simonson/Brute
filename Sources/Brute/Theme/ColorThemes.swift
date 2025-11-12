//
//  ColorThemes.swift
//  Brute
//
//  Created by Lukas Simonson on 11/12/25.
//

import SwiftUI

public struct LightAndDarkTheme: BruteColorTheme {
    public let light: BruteTheme.Colors
    public let dark: BruteTheme.Colors

    public func colors(for scheme: ColorScheme) -> BruteTheme.Colors {
        switch scheme {
            case .dark: dark
            default: light
        }
    }
}

// MARK: - Default Color Themes

extension BruteColorTheme where Self == LightAndDarkTheme {

    static var `default`: LightAndDarkTheme { violet }

    static var violet: LightAndDarkTheme {
        LightAndDarkTheme(
            light: .violet,
            dark: .violetDark
        )
    }

    static var blue: LightAndDarkTheme {
        LightAndDarkTheme(
            light: .blue,
            dark: .blueDark
        )
    }

    static var orange: LightAndDarkTheme {
        LightAndDarkTheme(
            light: .orange,
            dark: .orangeDark
        )
    }

    static var green: LightAndDarkTheme {
        LightAndDarkTheme(
            light: .green,
            dark: .greenDark
        )
    }
}
