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
    }
}

extension BruteTheme.Dimensions {
    public static let `default` = BruteTheme.Dimensions(
        cornerRadius: 5,
        shadowOffset: (4, 4),
        borderWidth: 2
    )
}
