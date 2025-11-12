//
//  Dimensions.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension BruteTheme {
    public struct Dimensions: Sendable {
        public let cornerRadius: CGFloat
        public let shadowOffset: CGSize
        public let borderWidth: CGFloat

        public let smallContentPadding: CGFloat
        public let contentPadding: CGFloat
    }
}

// MARK: - Default Dimensions
extension BruteTheme.Dimensions {
    public static var `default`: BruteTheme.Dimensions { lightCurveBottomRight }

    public static let lightCurveBottomRight = BruteTheme.Dimensions(
        cornerRadius: 5,
        shadowOffset: CGSize(width: 4, height: 4),
        borderWidth: 2,

        smallContentPadding: 8,
        contentPadding: 16,
    )

    public static let straightTopRight = BruteTheme.Dimensions(
        cornerRadius: 0,
        shadowOffset: CGSize(width: 4, height: -4),
        borderWidth: 2,

        smallContentPadding: 8,
        contentPadding: 16,
    )

    public static let heavyCurveDown = BruteTheme.Dimensions(
        cornerRadius: 15,
        shadowOffset: CGSize(width: 0, height: 4),
        borderWidth: 2,

        smallContentPadding: 8,
        contentPadding: 16,
    )

    public static let medCurveTopLeft = BruteTheme.Dimensions(
        cornerRadius: 10,
        shadowOffset: CGSize(width: -4, height: -4),
        borderWidth: 2,

        smallContentPadding: 8,
        contentPadding: 16,
    )
}

// MARK: - Copy
extension BruteTheme.Dimensions {
    func copy(
        cornerRadius: CGFloat? = nil,
        shadowOffset: CGSize? = nil,
        borderWidth: CGFloat? = nil,
        smallContentPadding: CGFloat? = nil,
        contentPadding: CGFloat? = nil
    ) -> BruteTheme.Dimensions {
        BruteTheme.Dimensions(
            cornerRadius: cornerRadius ?? self.cornerRadius,
            shadowOffset: shadowOffset ?? self.shadowOffset,
            borderWidth: borderWidth ?? self.borderWidth,
            smallContentPadding: smallContentPadding ?? self.smallContentPadding,
            contentPadding: contentPadding ?? self.contentPadding
        )
    }
}
