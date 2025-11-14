//
//  DimensionSet.swift
//  Brute
//
//  Created by Lukas Simonson on 11/13/25.
//

import SwiftUI

extension LeveledBruteTheme {
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
extension LeveledBruteTheme.DimensionSet {
    public static var violet: LeveledBruteTheme.DimensionSet {
        LeveledBruteTheme.DimensionSet(
            cornerRadius: 5.0,
            shadowOffset: CGSize(width: 3.0, height: 3.0),
            borderWidth: 3.0,

            paddingSmall: 8.0,
            paddingMedium: 16.0,
            paddingLarge: 32.0
        )
    }
}
