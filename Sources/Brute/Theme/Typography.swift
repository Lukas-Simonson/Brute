//
//  Typography.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension BruteTheme {
    public struct Typography: Sendable {
        let header: Font
        let caption: Font
    }
}

extension BruteTheme.Typography {
    public static let `default` = BruteTheme.Typography(
        header: Font.system(.headline, design: .rounded, weight: .bold),
        caption: Font.system(.caption, design: .rounded, weight: .regular)
    )
}
