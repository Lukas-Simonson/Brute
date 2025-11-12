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
    public static var `default`: BruteTheme { violet }

    public static let violet = BruteTheme(
        color: .violet,
        font: .default,
        dimen: .lightCurveBottomRight
    )

    public static let blue = BruteTheme(
        color: .blue,
        font: .default,
        dimen: .straightTopRight
    )

    public static let green = BruteTheme(
        color: .green,
        font: .default,
        dimen: .heavyCurveDown
    )

    public static let orange = BruteTheme(
        color: .orange,
        font: .default,
        dimen: .medCurveTopLeft
    )
}
