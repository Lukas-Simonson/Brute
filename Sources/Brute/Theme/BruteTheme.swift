//
//  BruteTheme.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

public struct BruteTheme: Sendable {
    public let color: BruteTheme.Colors
    public let font: BruteTheme.Typography
    public let dimen: BruteTheme.Dimensions
}

extension BruteTheme {
    public static let `default` = BruteTheme(
        color: .default,
        font: .default,
        dimen: .default
    )
}

extension EnvironmentValues {
    @Entry
    public var bruteTheme = BruteTheme.default

    public var bruteColor: BruteTheme.Colors {
        bruteTheme.color
    }

    public var bruteFont: BruteTheme.Typography {
        bruteTheme.font
    }

    public var bruteDimen: BruteTheme.Dimensions {
        bruteTheme.dimen
    }
}
