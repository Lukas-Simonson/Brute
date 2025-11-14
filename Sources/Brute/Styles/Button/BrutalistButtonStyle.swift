//
//  BrutalistButtonStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension ButtonStyle where Self == BrutalistButtonStyle {
    public static var brute: Self { BrutalistButtonStyle() }
}

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
                .withLeveledBruteTheme(.violet)

            Button("Blue Button") { /* does nothing */ }
                .withLeveledBruteTheme(.blue)

            Button("Orange Button") { /* does nothing */ }
                .withLeveledBruteTheme(.orange)

            Button("Green Button") { /* does nothing */ }
                .withLeveledBruteTheme(.green)
        }
        .buttonStyle(.brute)
    }
}
