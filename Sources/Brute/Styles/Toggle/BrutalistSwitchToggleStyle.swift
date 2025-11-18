//
//  BrutalistSwitchToggleStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension ToggleStyle where Self == BrutalistSwitchToggleStyle {
    /// A brutalist switch toggle style with sliding circular indicator.
    public static var bruteSwitch: Self { BrutalistSwitchToggleStyle() }
}

/// A toggle style displaying a capsule-shaped switch with animated sliding circle.
///
/// Shows a pill-shaped track that changes color when toggled. A circular knob slides
/// between leading and trailing positions with smooth animation.
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
            .bruteTheme(.violet)

            Toggle(isOn: $isOn) {
                Text("Blue Switch Toggle")
            }
            .bruteTheme(.blue)

            Toggle(isOn: $isOn) {
                Text("Orange Switch Toggle")
            }
            .bruteTheme(.orange)

            Toggle(isOn: $isOn) {
                Text("Green Switch Toggle")
            }
            .bruteTheme(.green)
        }
        .padding()
        .toggleStyle(.bruteSwitch)
    }
}
