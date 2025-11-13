//
//  BrutePickerStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/12/25.
//

import SwiftUI

extension EnvironmentValues {
    @Entry
    var brutePickerStyle: BrutePickerStyle = SegmentedBrutePickerStyle()
}

extension View {
    func brutePickerStyle(_ style: BrutePickerStyle) -> some View {
        self.environment(\.brutePickerStyle, style)
    }
}

public protocol BrutePickerStyle {
    typealias Configuration = BrutePickerStyleConfiguration
    typealias ChildConfiguration = BrutePickerStyleChildConfiguration

    @MainActor func makeBody(config: Configuration) -> AnyView
    @MainActor func makeChild(config: ChildConfiguration) -> AnyView
}

public struct BrutePickerStyleConfiguration {
    let theme: BruteTheme
    let selection: AnyHashable
    let children: AnyView
}

public struct BrutePickerStyleChildConfiguration {
    let theme: BruteTheme
    let view: AnyView
    @Binding var isSelected: Bool
}
