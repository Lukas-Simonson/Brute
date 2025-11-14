//
//  BruteContext.swift
//  Brute
//
//  Created by Lukas Simonson on 11/13/25.
//

import SwiftUI

extension EnvironmentValues {
    @Entry public var bruteTheme: BruteTheme = .violet

    @Entry var bruteColorSetOverride: BruteTheme.ColorSet? = nil
    @Entry var bruteDimensionSetOverride: BruteTheme.DimensionSet? = nil
    @Entry var bruteFontSetOverride: BruteTheme.FontSet? = nil

    public var bruteContext: BruteContext {
        BruteContext(
            color: bruteColorSetOverride ?? bruteTheme.color(for: colorScheme),
            dimen: bruteDimensionSetOverride ?? bruteTheme.dimen,
            font: bruteFontSetOverride ?? bruteTheme.font
        )
    }
}

public struct BruteContext {
    public let color: BruteTheme.ColorSet
    public let dimen: BruteTheme.DimensionSet
    public let font: BruteTheme.FontSet
}

extension View {
    public func bruteThemeLeveled(by change: Int) -> some View {
        self.modifier(ThemeLeveledViewModifier(change: change))
    }

    public func bruteTheme(_ theme: BruteTheme) -> some View {
        self.environment(\.bruteTheme, theme)
    }

    public func overrideBruteColor(_ set: BruteTheme.ColorSet?) -> some View {
        self.environment(\.bruteColorSetOverride, set)
    }

    public func overrideBruteDimen(_ set: BruteTheme.DimensionSet?) -> some View {
        self.environment(\.bruteDimensionSetOverride, set)
    }

    public func overrideBruteFont(_ set: BruteTheme.FontSet?) -> some View {
        self.environment(\.bruteFontSetOverride, set)
    }
}

fileprivate struct ThemeLeveledViewModifier: ViewModifier {
    @Environment(\.bruteTheme) private var theme

    let change: Int

    func body(content: Content) -> some View {
        content
            .environment(\.bruteTheme, theme.leveled(by: change))
    }
}
