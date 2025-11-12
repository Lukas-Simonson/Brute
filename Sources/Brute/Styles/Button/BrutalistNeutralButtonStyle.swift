//
//  BrutalistNeutralButtonStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension ButtonStyle where Self == BrutalistNeutralButtonStyle {
    public static var brutalistNeutral: Self { BrutalistNeutralButtonStyle() }
}

public struct BrutalistNeutralButtonStyle: ButtonStyle {

    @Environment(\.bruteTheme) private var theme

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(theme.dimen.contentPadding)
            .background(theme.color.tertiaryBackground)
            .bruteClipped()
            .bruteStroked()
            .offset(configuration.isPressed ? theme.dimen.shadowOffset : .zero)
            .bruteShadow()
    }
}

#Preview {
    VStack(spacing: 30) {
        Button("Violet Button") { /* does nothing */ }
            .buttonStyle(.brutalistNeutral)
            .environment(\.bruteTheme, .violet)

        Button("Blue Button") { /* does nothing */ }
            .buttonStyle(.brutalistNeutral)
            .environment(\.bruteTheme, .blue)

        Button("Orange Button") { /* does nothing */ }
            .buttonStyle(.brutalistNeutral)
            .environment(\.bruteTheme, .orange)

        Button("Green Button") { /* does nothing */ }
            .buttonStyle(.brutalistNeutral)
            .environment(\.bruteTheme, .green)
    }
    .padding()
}
