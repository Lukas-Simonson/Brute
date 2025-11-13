//
//  BrutePickerStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/12/25.
//

import SwiftUI

extension EnvironmentValues {
    @Entry
    internal var brutePickerStyle: BrutePickerStyle = .segmented
}

extension View {
    public func brutePickerStyle(_ style: BrutePickerStyle) -> some View {
        self.environment(\.brutePickerStyle, style)
    }
}

public enum BrutePickerStyle {
    case segmented
}
