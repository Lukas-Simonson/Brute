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
    
    public static func brute(fill: Color) -> Self {
        BrutalistButtonStyle(color: fill)
    }
}

/// A button style featuring accent colors with an offset shadow that animates on press.
///
/// This is the primary button style in the Brute design system. When pressed, the button
/// moves down toward its shadow, creating a tactile press effect.
public struct BrutalistButtonStyle: ButtonStyle {

    @Environment(\.bruteContext) private var context
    @Environment(\.isEnabled) private var isEnabled
    
    public var color: Color?

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(context.dimen.paddingMedium)
            .foregroundStyle(context.color.accentForeground)
            .background(color ?? context.color.accentBackground)
            .bruteClipped()
            .bruteStroked()
            .offset(configuration.isPressed ? context.dimen.shadowOffset : .zero)
            .bruteShadow()
            .saturation(isEnabled ? 1.0 : 0.25)
    }
}

#Preview {
    BruteStyle {
        VStack(spacing: 30) {
            HStack {
                Button("Violet Button") { /* does nothing */ }
                Button("Disabled Violet Button") { /* does nothing */ }
                    .disabled(true)
            }.bruteTheme(.violet)

            HStack {
                Button("Blue Button") { /* does nothing */ }
                Button("Disabled blue Button") { /* does nothing */ }
                    .disabled(true)
            }.bruteTheme(.blue)

            HStack {
                Button("Orange Button") { /* does nothing */ }
                Button("Disabled Orange Button") { /* does nothing */ }
                    .disabled(true)
            }.bruteTheme(.orange)

            HStack {
                Button("Green Button") { /* does nothing */ }
                Button("Disabled Green Button") { /* does nothing */ }
                    .disabled(true)
            }.bruteTheme(.green)
        }
        .buttonStyle(.brute)
    }
}
