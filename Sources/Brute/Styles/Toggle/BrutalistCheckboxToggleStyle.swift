//
//  BrutalistCheckboxToggleStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension ToggleStyle where Self == BrutalistCheckboxToggleStyle {
    /// A brutalist checkbox toggle style with square indicator and checkmark.
    public static var bruteCheckbox: Self { BrutalistCheckboxToggleStyle() }
}

/// A toggle style displaying a square checkbox with checkmark when selected.
///
/// Shows a square box that fills with accent color and displays a checkmark icon
/// when the toggle is on. Uses neutral colors when off.
public struct BrutalistCheckboxToggleStyle: ToggleStyle {

    @Environment(\.bruteContext) private var context

    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            Rectangle()
                .fill(
                    configuration.isOn ? context.color.accentBackground : context.color.neutralBackground
                )
                .stroke(context.color.border, lineWidth: context.dimen.borderWidth)
                .aspectRatio(1, contentMode: .fit)
                .frame(maxHeight: 25)
                .overlay {
                    if configuration.isOn {
                        Image(systemName: "checkmark")
                            .foregroundStyle(context.color.accentForeground)
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

    @Previewable @State var isOn = true

    BruteStyle {
        VStack(alignment: .leading) {
            Toggle(isOn: $isOn) {
                Text("Violet Checkbox")
            }
            .bruteTheme(.violet)

            Toggle(isOn: $isOn) {
                Text("Blue Checkbox")
            }
            .bruteTheme(.blue)

            Toggle(isOn: $isOn) {
                Text("Orange Checkbox")
            }
            .bruteTheme(.orange)

            Toggle(isOn: $isOn) {
                Text("Green Checkbox")
            }
            .bruteTheme(.green)
        }
        .padding()
        .toggleStyle(.bruteCheckbox)
    }
}
