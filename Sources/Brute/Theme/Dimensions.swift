//
//  Dimensions.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension BruteTheme {
    public struct Dimensions: Sendable {
        let cornerRadius: CGFloat
        let shadowOffset: (vertical: CGFloat, horizontal: CGFloat)
        let borderWidth: CGFloat

        let contentPadding: CGFloat
    }
}

extension BruteTheme.Dimensions {
    public static var `default`: BruteTheme.Dimensions { lightCurveBottomRight }

    public static let lightCurveBottomRight = BruteTheme.Dimensions(
        cornerRadius: 5,
        shadowOffset: (vertical: 4, horizontal: 4),
        borderWidth: 2,

        contentPadding: 16,
    )

    public static let straightTopRight = BruteTheme.Dimensions(
        cornerRadius: 0,
        shadowOffset: (vertical: -4, horizontal: 4),
        borderWidth: 2,

        contentPadding: 16,
    )

    public static let heavyCurveDown = BruteTheme.Dimensions(
        cornerRadius: 15,
        shadowOffset: (vertical: 4, horizontal: 0),
        borderWidth: 2,

        contentPadding: 16,
    )

    public static let medCurveTopLeft = BruteTheme.Dimensions(
        cornerRadius: 10,
        shadowOffset: (vertical: -4, horizontal: -4),
        borderWidth: 2,

        contentPadding: 16,
    )
}
