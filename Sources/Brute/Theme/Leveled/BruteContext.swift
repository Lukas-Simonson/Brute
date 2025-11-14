//
//  BruteContext.swift
//  Brute
//
//  Created by Lukas Simonson on 11/13/25.
//

import SwiftUI

extension EnvironmentValues {
    @Entry public var leveledBruteTheme: LeveledBruteTheme = .violet

    @Entry var bruteColorSetOverride: LeveledBruteTheme.ColorSet? = nil
    @Entry var bruteDimensionSetOverride: LeveledBruteTheme.DimensionSet? = nil
    @Entry var bruteFontSetOverride: LeveledBruteTheme.FontSet? = nil

    public var bruteContext: BruteContext {
        BruteContext(
            color: bruteColorSetOverride ?? leveledBruteTheme.color(for: colorScheme),
            dimen: bruteDimensionSetOverride ?? leveledBruteTheme.dimen,
            font: bruteFontSetOverride ?? leveledBruteTheme.font
        )
    }
}

public struct BruteContext {
    let color: LeveledBruteTheme.ColorSet
    let dimen: LeveledBruteTheme.DimensionSet
    let font: LeveledBruteTheme.FontSet
}

extension View {
    func bruteThemeLeveled(by change: Int) -> some View {
        self.modifier(ThemeLeveledViewModifier(change: change))
    }

    func overrideBruteColor(_ set: LeveledBruteTheme.ColorSet?) -> some View {
        self.environment(\.bruteColorSetOverride, set)
    }

    func overrideBruteDimen(_ set: LeveledBruteTheme.DimensionSet?) -> some View {
        self.environment(\.bruteDimensionSetOverride, set)
    }

    func overrideBruteFont(_ set: LeveledBruteTheme.FontSet?) -> some View {
        self.environment(\.bruteFontSetOverride, set)
    }
}

fileprivate struct ThemeLeveledViewModifier: ViewModifier {
    @Environment(\.leveledBruteTheme) private var theme

    let change: Int

    func body(content: Content) -> some View {
        content
            .environment(\.leveledBruteTheme, theme.leveled(by: change))
    }
}
