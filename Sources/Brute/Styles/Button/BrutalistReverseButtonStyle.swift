//
//  BrutalistReverseButtonStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension ButtonStyle where Self == BrutalistReverseButtonStyle {
    public static var bruteReverse: Self { BrutalistReverseButtonStyle() }
}

public struct BrutalistReverseButtonStyle: ButtonStyle {

    @Environment(\.bruteTheme) private var theme

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(theme.dimen.contentPadding)
            .background(theme.color.secondaryBackground)
            .bruteClipped()
            .bruteStroked()
            .offset(configuration.isPressed ? .zero : theme.dimen.shadowOffset)
            .bruteShadow()
    }
}

#Preview {
    VStack(spacing: 30) {
        Button("Violet Button") { /* does nothing */ }
            .buttonStyle(.bruteReverse)
            .environment(\.bruteTheme, .violet)

        Button("Blue Button") { /* does nothing */ }
            .buttonStyle(.bruteReverse)
            .environment(\.bruteTheme, .blue)

        Button("Orange Button") { /* does nothing */ }
            .buttonStyle(.bruteReverse)
            .environment(\.bruteTheme, .orange)

        Button("Green Button") { /* does nothing */ }
            .buttonStyle(.bruteReverse)
            .environment(\.bruteTheme, .green)
    }
    .padding()
}
