//
//  SegmentedBrutePickerStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/13/25.
//

import SwiftUI

public struct SegmentedBrutePickerStyle: BrutePickerStyle {

    public func makeBody(config: Configuration) -> AnyView {
        HStack(spacing: config.theme.dimen.smallContentPadding) {
            config.children
        }
        .animation(.linear(duration: 0.1), value: config.selection)
        .padding(config.theme.dimen.smallContentPadding)
        .background(config.theme.color.background)
        .bruteClipped()
        .bruteStroked()
        .erased()
    }

    public func makeChild(config: ChildConfiguration) -> AnyView {
        config.view
            .frame(maxWidth: .infinity)
            .padding(config.theme.dimen.smallContentPadding)
            .background {
                RoundedRectangle(cornerRadius: config.theme.dimen.cornerRadius)
                    .fill(config.isSelected ? config.theme.color.secondaryBackground : config.theme.color.background)
                    .stroke(config.isSelected ? config.theme.color.border : .clear, lineWidth: config.theme.dimen.borderWidth)
            }
            .onTapGesture { config.isSelected = true }
            .erased()
    }
}
