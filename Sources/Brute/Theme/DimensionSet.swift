//
//  DimensionSet.swift
//  Brute
//
//  Created by Lukas Simonson on 11/13/25.
//

import SwiftUI

extension BruteTheme {
    public struct DimensionSet {
        public let cornerRadius: CGFloat
        public let shadowOffset: CGSize
        public let borderWidth: CGFloat

        public let paddingSmall: CGFloat
        public let paddingMedium: CGFloat
        public let paddingLarge: CGFloat
    }
}

// MARK: - Violet
extension BruteTheme.DimensionSet {
    public static var violet: BruteTheme.DimensionSet {
        BruteTheme.DimensionSet(
            cornerRadius: 5.0,
            shadowOffset: CGSize(width: 4.0, height: 4.0),
            borderWidth: 2.0,

            paddingSmall: 8.0,
            paddingMedium: 16.0,
            paddingLarge: 32.0
        )
    }

    public static var blue: BruteTheme.DimensionSet {
        BruteTheme.DimensionSet(
            cornerRadius: 0.0,
            shadowOffset: CGSize(width: 4.0, height: -4.0),
            borderWidth: 2.0,

            paddingSmall: 8.0,
            paddingMedium: 16.0,
            paddingLarge: 32.0
        )
    }

    public static var orange: BruteTheme.DimensionSet {
        BruteTheme.DimensionSet(
            cornerRadius: 10.0,
            shadowOffset: CGSize(width: -4.0, height: -4.0),
            borderWidth: 2.0,

            paddingSmall: 8.0,
            paddingMedium: 16.0,
            paddingLarge: 32.0
        )
    }

    public static var green: BruteTheme.DimensionSet {
        BruteTheme.DimensionSet(
            cornerRadius: 15.0,
            shadowOffset: CGSize(width: 0, height: 4.0),
            borderWidth: 2.0,

            paddingSmall: 8.0,
            paddingMedium: 16.0,
            paddingLarge: 32.0
        )
    }
}
