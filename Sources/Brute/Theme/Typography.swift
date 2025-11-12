//
//  Typography.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension BruteTheme {
    public struct Typography: Sendable {
        public let header: Font
        public let caption: Font
    }
}

// MARK: - Default Typography
extension BruteTheme.Typography {
    public static let `default` = BruteTheme.Typography(
        header: Font.system(.headline, design: .rounded, weight: .bold),
        caption: Font.system(.caption, design: .rounded, weight: .regular)
    )
}

// MARK: - Copy
extension BruteTheme.Typography {
    func copy(
        header: Font? = nil,
        caption: Font? = nil
    ) -> BruteTheme.Typography {
        BruteTheme.Typography(
            header: header ?? self.header,
            caption: caption ?? self.caption,
        )
    }
}
