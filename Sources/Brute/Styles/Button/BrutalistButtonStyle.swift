//
//  BrutalistButtonStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension ButtonStyle where Self == BrutalistButtonStyle {
    /// The default brutalist button style with accent colors and press animation.
    public static var brute: Self { BrutalistButtonStyle() }
}

/// A button style featuring accent colors with an offset shadow that animates on press.
///
/// This is the primary button style in the Brute design system. When pressed, the button
/// moves down toward its shadow, creating a tactile press effect.
public struct BrutalistButtonStyle: ButtonStyle {

    @Environment(\.bruteContext) private var context

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(context.dimen.paddingMedium)
            .foregroundStyle(context.color.accentForeground)
            .background(context.color.accentBackground)
            .bruteClipped()
            .bruteStroked()
            .offset(configuration.isPressed ? context.dimen.shadowOffset : .zero)
            .bruteShadow()
            .animation(.easeIn(duration: 0.05), value: configuration.isPressed)
    }
}

#Preview {
    BruteStyle {
        VStack(spacing: 30) {
            Button("Violet Button") { /* does nothing */ }
                .bruteTheme(.violet)

            Button("Blue Button") { /* does nothing */ }
                .bruteTheme(.blue)

            Button("Orange Button") { /* does nothing */ }
                .bruteTheme(.orange)

            Button("Green Button") { /* does nothing */ }
                .bruteTheme(.green)
        }
        .buttonStyle(.brute)
    }
}
