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

    @Environment(\.bruteContext) private var context

    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            Capsule()
                .fill(
                    configuration.isOn ? context.color.accentBackground : context.color.neutralBackground
                )
                .stroke(context.color.border, lineWidth: context.dimen.borderWidth)
                .aspectRatio(2/1, contentMode: .fit)
                .frame(maxHeight: 25)
                .overlay(alignment: configuration.isOn ? .trailing : .leading) {
                    Circle()
                        .fill(context.color.neutralForeground)
                        .stroke(context.color.border, lineWidth: context.dimen.borderWidth)
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

    @Previewable @State var isOn = true

    BruteStyle {
        VStack(alignment: .leading) {
            Toggle(isOn: $isOn) {
                Text("Violet Switch Toggle")
            }
            .withLeveledBruteTheme(.violet)

            Toggle(isOn: $isOn) {
                Text("Blue Switch Toggle")
            }
            .withLeveledBruteTheme(.blue)

            Toggle(isOn: $isOn) {
                Text("Orange Switch Toggle")
            }
            .withLeveledBruteTheme(.orange)

            Toggle(isOn: $isOn) {
                Text("Green Switch Toggle")
            }
            .withLeveledBruteTheme(.green)
        }
        .padding()
        .toggleStyle(.bruteSwitch)
    }
}
