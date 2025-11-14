//
//  FontSet.swift
//  Brute
//
//  Created by Lukas Simonson on 11/13/25.
//

import SwiftUI

extension LeveledBruteTheme {
    public struct FontSet {
        public let title: Font
        public let header: Font
        public let body: Font
        public let caption: Font
    }
}

// MARK: - Violet
extension LeveledBruteTheme.FontSet {
    public static var violet: LeveledBruteTheme.FontSet {
        LeveledBruteTheme.FontSet(
            title: Font.system(.title, design: .rounded, weight: .bold),
            header: Font.system(.headline, design: .rounded, weight: .bold),
            body: Font.system(.body, design: .rounded, weight: .regular),
            caption: Font.system(.caption, design: .monospaced, weight: .bold)
        )
    }
}
