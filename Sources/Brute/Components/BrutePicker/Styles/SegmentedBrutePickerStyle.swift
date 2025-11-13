//
//  SegmentedBrutePickerStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/13/25.
//

import SwiftUI


extension BrutePickerStyle where Self == SegmentedBrutePickerStyle {
    public static var segmented: Self { SegmentedBrutePickerStyle() }
}

public struct SegmentedBrutePickerStyle: BrutePickerStyle {

    @Environment(\.bruteTheme) var theme

    public func makeBody(config: Configuration) -> some View {
        let theme = config.environment.bruteTheme

        return HStack(spacing: theme.dimen.smallContentPadding) {
            config.children
        }
        .animation(.linear(duration: 0.1), value: config.selection)
        .padding(theme.dimen.smallContentPadding)
        .background(theme.color.background)
        .bruteClipped()
        .bruteStroked()
    }

    public func makeChild(config: ChildConfiguration) -> some View {
        let theme = config.environment.bruteTheme

        return config.label
            .frame(maxWidth: .infinity)
            .padding(theme.dimen.smallContentPadding)
            .background {
                RoundedRectangle(cornerRadius: theme.dimen.cornerRadius)
                    .fill(config.isSelected ? theme.color.secondaryBackground : theme.color.background)
                    .stroke(config.isSelected ? theme.color.border : .clear, lineWidth: theme.dimen.borderWidth)
            }
            .onTapGesture { config.isSelected = true }
    }
}
