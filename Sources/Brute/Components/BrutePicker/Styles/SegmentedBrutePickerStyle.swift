//
//  SegmentedBrutePickerStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/13/25.
//

import SwiftUI
import Flow

extension BrutePickerStyle where Self == SegmentedBrutePickerStyle {
    public static var segmented: Self { SegmentedBrutePickerStyle() }
}

public struct SegmentedBrutePickerStyle: BrutePickerStyle {

    public func makeBody(config: Configuration) -> some View {
        let context = config.environment.bruteContext

        return HFlow(spacing: context.dimen.paddingSmall) {
            config.children
        }
        .animation(.linear(duration: 0.1), value: config.selection)
        .padding(context.dimen.paddingSmall)
        .background(context.color.background)
        .bruteClipped()
        .bruteStroked()
    }

    public func makeChild(config: ChildConfiguration) -> some View {
        let context = config.environment.bruteContext

        return config.label
            .frame(maxWidth: .infinity)
            .padding(context.dimen.paddingSmall)
            .background {
                RoundedRectangle(cornerRadius: context.dimen.cornerRadius)
                    .fill(config.isSelected ? context.color.accentBackground : context.color.background)
                    .stroke(config.isSelected ? context.color.border : .clear, lineWidth: context.dimen.borderWidth)
            }
            .onTapGesture { config.isSelected = true }
    }
}

#Preview {
    @Previewable @State var selection = "Account"
    let tabs = ["Account", "Profile", "Settings", "Social Media", "Now Playing"]

    BruteStyle {
        VStack {
            BrutePicker(selection: $selection) {
                ForEach(tabs, id: \.self) { value in
                    Text(value)
                }
            }.bruteTheme(.violet)

            BrutePicker(selection: $selection) {
                ForEach(tabs, id: \.self) { value in
                    Text(value)
                }
            }.bruteTheme(.blue)

            BrutePicker(selection: $selection) {
                ForEach(tabs, id: \.self) { value in
                    Text(value)
                }
            }.bruteTheme(.orange)

            BrutePicker(selection: $selection) {
                ForEach(tabs, id: \.self) { value in
                    Text(value)
                }
            }.bruteTheme(.green)
        }
        .brutePickerStyle(.segmented)
        .padding()
    }
}
