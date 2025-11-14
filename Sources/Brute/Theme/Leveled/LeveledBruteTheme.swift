//
//  TieredBruteTheme.swift
//  Brute
//
//  Created by Lukas Simonson on 11/13/25.
//

import SwiftUI

public struct LeveledBruteTheme {
    let level: Int

    private let colors: [ColorSchemeSet]
    private let dimensions: [DimensionSet]
    private let fonts: [FontSet]

    public init(level: Int = 0, colors: [ColorSchemeSet], dimensions: [DimensionSet], fonts: [FontSet]) {
        assert(colors.count >= 1, "BruteTheme must include at least one `ColorSet`")
        assert(dimensions.count >= 1, "BruteTheme must include at least one `DimensionSet`")
        assert(fonts.count >= 1, "BruteTheme must include at least one `FontSet`")

        self.level = level
        self.colors = colors
        self.dimensions = dimensions
        self.fonts = fonts
    }

    public var dimen: DimensionSet { dimen(for: level) }
    public var font: FontSet { font(for: level) }

    public func color(for scheme: ColorScheme) -> ColorSet {
        color(for: level, scheme: scheme)
    }

    public func color(for level: Int, scheme: ColorScheme) -> ColorSet {
        guard level < colors.count else { return colors.last!.color(for: scheme) }
        return colors[level].color(for: scheme)
    }

    public func dimen(for level: Int) -> DimensionSet {
        guard level < dimensions.count else { return dimensions.last! }
        return dimensions[level]
    }

    public func font(for level: Int) -> FontSet {
        guard level < fonts.count else { return fonts.last! }
        return fonts[level]
    }

    public func leveled(by amount: Int) -> LeveledBruteTheme {
        LeveledBruteTheme(level: max(0, level + amount), colors: colors, dimensions: dimensions, fonts: fonts)
    }
}

extension LeveledBruteTheme {
    public static var violet: LeveledBruteTheme {
        LeveledBruteTheme(
            colors: [.violetZero, .violetOne, .violetTwo],
            dimensions: [.violet],
            fonts: [.violet]
        )
    }

    public static var blue: LeveledBruteTheme {
        LeveledBruteTheme(
            colors: [.blueZero, .blueOne, .blueTwo],
            dimensions: [.violet],
            fonts: [.violet]
        )
    }

    public static var orange: LeveledBruteTheme {
        LeveledBruteTheme(
            colors: [.orangeZero, .orangeOne, .orangeTwo],
            dimensions: [.violet],
            fonts: [.violet]
        )
    }

    public static var green: LeveledBruteTheme {
        LeveledBruteTheme(
            colors: [.greenZero, .greenOne, .greenTwo],
            dimensions: [.violet],
            fonts: [.violet]
        )
    }

    public static var multi: LeveledBruteTheme {
        LeveledBruteTheme(
            colors: [.multicolorZero, .multicolorOne, .multicolorTwo],
            dimensions: [.violet],
            fonts: [.violet]
        )
    }
}
