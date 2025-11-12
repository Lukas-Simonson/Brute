//
//  BrutalistCheckboxToggleStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension ToggleStyle where Self == BrutalistCheckboxToggleStyle {
    public static var bruteCheckbox: Self { BrutalistCheckboxToggleStyle() }
}

public struct BrutalistCheckboxToggleStyle: ToggleStyle {

    @Environment(\.bruteTheme) private var theme

    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            Rectangle()
                .fill(
                    configuration.isOn ? theme.color.secondaryBackground : theme.color.tertiaryBackground
                )
                .stroke(theme.color.border, lineWidth: theme.dimen.borderWidth)
                .aspectRatio(1, contentMode: .fit)
                .frame(maxHeight: 25)
                .overlay {
                    if configuration.isOn {
                        Image(systemName: "checkmark")
                            .foregroundStyle(theme.color.secondaryForeground)
                    }
                }

            configuration.label
        }
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
            Text("Violet Checkbox")
        }
        .toggleStyle(.bruteCheckbox)
        .bruteTheme(.violet)

        Toggle(isOn: $isOn) {
            Text("Blue Checkbox")
        }
        .toggleStyle(.bruteCheckbox)
        .bruteTheme(.blue)

        Toggle(isOn: $isOn) {
            Text("Orange Checkbox")
        }
        .toggleStyle(.bruteCheckbox)
        .bruteTheme(.orange)

        Toggle(isOn: $isOn) {
            Text("Green Checkbox")
        }
        .toggleStyle(.bruteCheckbox)
        .bruteTheme(.green)
    }
    .padding()
    .background(theme.color.background)
    .brutalized()
}
