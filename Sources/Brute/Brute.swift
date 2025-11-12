// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

extension EnvironmentValues {
    @Entry public var bruteColorTheme: BruteColorTheme = .default
    @Entry public var bruteFont: BruteTheme.Typography = .default
    @Entry public var bruteDimen: BruteTheme.Dimensions = .default

    public var bruteColor: BruteTheme.Colors {
        bruteColorTheme.colors(for: colorScheme)
    }

    public var bruteTheme: BruteTheme {
        get {
            BruteTheme(
                scheme: colorScheme,
                colorTheme: bruteColorTheme,
                font: bruteFont,
                dimen: bruteDimen
            )
        }
        set {
            bruteColorTheme = newValue.colorTheme
            bruteFont = newValue.font
            bruteDimen = newValue.dimen
        }
    }
}

extension View {
    public func bruteTheme(_ theme: BruteTheme) -> some View {
        self.environment(\.bruteTheme, theme)
    }

    public func bruteFont(_ font: BruteTheme.Typography) -> some View {
        self.environment(\.bruteFont, font)
    }

    public func bruteColor(_ colors: BruteColorTheme) -> some View {
        self.environment(\.bruteColorTheme, colors)
    }

    public func bruteDimen(_ dimens: BruteTheme.Dimensions) -> some View {
        self.environment(\.bruteDimen, dimens)
    }
}
