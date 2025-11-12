// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

extension EnvironmentValues {
    @Entry public var bruteColor: BruteTheme.Colors = .default
    @Entry public var bruteFont: BruteTheme.Typography = .default
    @Entry public var bruteDimen: BruteTheme.Dimensions = .default

    public var bruteTheme: BruteTheme {
        get {
            BruteTheme(color: bruteColor, font: bruteFont, dimen: bruteDimen)
        }
        set {
            bruteColor = newValue.color
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

    public func bruteColor(_ colors: BruteTheme.Colors) -> some View {
        self.environment(\.bruteColor, colors)
    }

    public func bruteDimen(_ dimens: BruteTheme.Dimensions) -> some View {
        self.environment(\.bruteDimen, dimens)
    }
}
