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

    @Environment(\.bruteTheme) private var theme

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(theme.dimen.contentPadding)
            .background(theme.color.secondaryBackground)
            .bruteClipped()
            .bruteStroked()
            .offset(configuration.isPressed ? theme.dimen.shadowOffset : .zero)
            .bruteShadow()
            // TODO: Implement Animation for MacOS
            // .animation(.easeIn(duration: 0.05), value: configuration.isPressed)
    }
}

#Preview {
    VStack(spacing: 30) {
        Button("Violet Button") { /* does nothing */ }
            .buttonStyle(.brute)
            .bruteTheme(.violet)

        Button("Blue Button") { /* does nothing */ }
            .buttonStyle(.brute)
            .bruteTheme(.blue)

        Button("Orange Button") { /* does nothing */ }
            .buttonStyle(.brute)
            .bruteTheme(.orange)

        Button("Green Button") { /* does nothing */ }
            .buttonStyle(.brute)
            .bruteTheme(.green)
    }
    .padding()
}
