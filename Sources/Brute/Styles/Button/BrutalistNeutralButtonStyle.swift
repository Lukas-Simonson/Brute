//
//  BrutalistNeutralButtonStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension ButtonStyle where Self == BrutalistNeutralButtonStyle {
    public static var bruteNeutral: Self { BrutalistNeutralButtonStyle() }
}

public struct BrutalistNeutralButtonStyle: ButtonStyle {

    @Environment(\.bruteTheme) private var theme

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(theme.dimen.contentPadding)
            .foregroundStyle(theme.color.tertiaryForeground)
            .background(theme.color.tertiaryBackground)
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
            .buttonStyle(.bruteNeutral)
            .bruteTheme(.violet)

        Button("Blue Button") { /* does nothing */ }
            .buttonStyle(.bruteNeutral)
            .bruteTheme(.blue)

        Button("Orange Button") { /* does nothing */ }
            .buttonStyle(.bruteNeutral)
            .bruteTheme(.orange)

        Button("Green Button") { /* does nothing */ }
            .buttonStyle(.bruteNeutral)
            .bruteTheme(.green)
    }
    .padding()
}
