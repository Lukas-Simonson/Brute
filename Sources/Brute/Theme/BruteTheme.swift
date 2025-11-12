//
//  BruteTheme.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

public struct BruteTheme: Sendable {
    public var scheme: ColorScheme? = nil
    public var color: BruteTheme.Colors {
        colorTheme.colors(for: scheme ?? .light)
    }

    public let colorTheme: BruteColorTheme
    public let font: BruteTheme.Typography
    public let dimen: BruteTheme.Dimensions
}

public protocol BruteColorTheme: Sendable {
    func colors(for scheme: ColorScheme) -> BruteTheme.Colors
}

extension BruteTheme {
    public static var `default`: BruteTheme { violet }

    public static let violet = BruteTheme(
        colorTheme: .violet,
        font: .default,
        dimen: .lightCurveBottomRight
    )

    public static let blue = BruteTheme(
        colorTheme: .blue,
        font: .default,
        dimen: .straightTopRight
    )

    public static let green = BruteTheme(
        colorTheme: .green,
        font: .default,
        dimen: .heavyCurveDown
    )

    public static let orange = BruteTheme(
        colorTheme: .orange,
        font: .default,
        dimen: .medCurveTopLeft
    )
}
