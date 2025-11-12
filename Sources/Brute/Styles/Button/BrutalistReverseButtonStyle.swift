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
            .background {
                RoundedRectangle(cornerRadius: theme.dimen.cornerRadius)
                    .fill(theme.color.border)
                    .offset(configuration.isPressed ? theme.dimen.shadowOffset : .zero)
            }
            // TODO: Implement Animation for MacOS
            // .animation(.easeIn(duration: 0.05), value: configuration.isPressed)
    }
}

#Preview {
    VStack(spacing: 30) {
        Button("Violet Button") { /* does nothing */ }
            .buttonStyle(.bruteReverse)
            .bruteTheme(.violet)

        Button("Blue Button") { /* does nothing */ }
            .buttonStyle(.bruteReverse)
            .bruteTheme(.blue)

        Button("Orange Button") { /* does nothing */ }
            .buttonStyle(.bruteReverse)
            .bruteTheme(.orange)

        Button("Green Button") { /* does nothing */ }
            .buttonStyle(.bruteReverse)
            .bruteTheme(.green)
    }
    .padding()
}
