//
//  BrutalistSwitchToggleStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension ToggleStyle where Self == BrutalistSwitchToggleStyle {
    public static var bruteSwitch: Self { BrutalistSwitchToggleStyle() }
}

public struct BrutalistSwitchToggleStyle: ToggleStyle {

    @Environment(\.bruteTheme) private var theme

    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            Capsule()
                .fill(
                    configuration.isOn ? theme.color.secondaryBackground : theme.color.tertiaryBackground
                )
                .stroke(theme.color.border, lineWidth: theme.dimen.borderWidth)
                .aspectRatio(2/1, contentMode: .fit)
                .frame(maxHeight: 25)
                .overlay(alignment: configuration.isOn ? .trailing : .leading) {
                    Circle()
                        .fill(theme.color.tertiaryBackground)
                        .stroke(theme.color.border, lineWidth: theme.dimen.borderWidth)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 5)
                }

            configuration.label
        }
        .animation(.easeInOut, value: configuration.isOn)
        .onTapGesture {
            configuration.$isOn.wrappedValue = !configuration.isOn
        }
    }
}

#Preview {

    @Previewable @Environment(\.bruteTheme) var theme
    @Previewable @State var isOn = true

    VStack(alignment: .leading) {
        Toggle(isOn: $isOn) {
            Text("Violet Switch Toggle")
        }
        .toggleStyle(.bruteSwitch)
        .environment(\.bruteTheme, .violet)

        Toggle(isOn: $isOn) {
            Text("Blue Switch Toggle")
        }
        .toggleStyle(.bruteSwitch)
        .environment(\.bruteTheme, .blue)

        Toggle(isOn: $isOn) {
            Text("Orange Switch Toggle")
        }
        .toggleStyle(.bruteSwitch)
        .environment(\.bruteTheme, .orange)

        Toggle(isOn: $isOn) {
            Text("Green Switch Toggle")
        }
        .toggleStyle(.bruteSwitch)
        .environment(\.bruteTheme, .green)
    }
    .padding()
    .background(theme.color.background)
    .brutalized()
}
