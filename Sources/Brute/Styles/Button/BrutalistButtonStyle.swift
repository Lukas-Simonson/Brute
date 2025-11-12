//
//  BrutalistButtonStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension ButtonStyle where Self == BrutalistButtonStyle {
    static var brutalist: Self { BrutalistButtonStyle() }
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
    }
}

#Preview {
    VStack(spacing: 30) {
        Button("Violet Button") { /* does nothing */ }
            .buttonStyle(.brutalist)
            .environment(\.bruteTheme, .violet)

        Button("Blue Button") { /* does nothing */ }
            .buttonStyle(.brutalist)
            .environment(\.bruteTheme, .blue)

        Button("Orange Button") { /* does nothing */ }
            .buttonStyle(.brutalist)
            .environment(\.bruteTheme, .orange)

        Button("Green Button") { /* does nothing */ }
            .buttonStyle(.brutalist)
            .environment(\.bruteTheme, .green)
    }
    .padding()
}
