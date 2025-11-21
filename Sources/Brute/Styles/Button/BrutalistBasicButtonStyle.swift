//
//  BrutalistBasicButtonStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension ButtonStyle where Self == BrutalistBasicButtonStyle {
    /// A simplified brutalist button style without shadow effects.
    public static var bruteBasic: Self { BrutalistBasicButtonStyle() }
}

/// A button style with accent colors and opacity-based press feedback.
///
/// This style provides a simpler appearance without shadows. When pressed,
/// the background becomes semi-transparent.
public struct BrutalistBasicButtonStyle: ButtonStyle {

    @Environment(\.bruteContext) private var context
    @Environment(\.isEnabled) private var isEnabled

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(context.color.accentForeground)
            .padding(context.dimen.paddingMedium)
            .background(
                context.color.accentBackground
                    .opacity(configuration.isPressed ? 0.75 : 1)
            )
            .bruteClipped()
            .bruteStroked()
            .saturation(isEnabled ? 1.0 : 0.25)
    }
}

#Preview {
    BruteStyle {
        VStack(spacing: 30) {
            Button("Violet Button") { /* does nothing */ }
                .bruteTheme(.violet)

            Button("Disabled Violet Button") { /* does nothing */ }
                .bruteTheme(.violet)
                .disabled(true)

            Button("Blue Button") { /* does nothing */ }
                .bruteTheme(.blue)

            Button("Orange Button") { /* does nothing */ }
                .bruteTheme(.orange)

            Button("Green Button") { /* does nothing */ }
                .bruteTheme(.green)
        }
        .buttonStyle(.bruteBasic)
    }
}
