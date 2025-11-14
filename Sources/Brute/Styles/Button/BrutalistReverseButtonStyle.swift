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

    @Environment(\.bruteContext) private var context

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(context.dimen.paddingMedium)
            .foregroundStyle(context.color.accentForeground)
            .background(context.color.accentBackground)
            .bruteClipped()
            .bruteStroked()
            .background {
                RoundedRectangle(cornerRadius: context.dimen.cornerRadius)
                    .fill(context.color.border)
                    .offset(configuration.isPressed ? context.dimen.shadowOffset : .zero)
            }
            .animation(.easeIn(duration: 0.05), value: configuration.isPressed)
    }
}

#Preview {
    VStack(spacing: 30) {
        Button("Violet Button") { /* does nothing */ }
            .buttonStyle(.bruteReverse)
            .withLeveledBruteTheme(.violet)

        Button("Blue Button") { /* does nothing */ }
            .buttonStyle(.bruteReverse)
            .withLeveledBruteTheme(.blue)

        Button("Orange Button") { /* does nothing */ }
            .buttonStyle(.bruteReverse)
            .withLeveledBruteTheme(.orange)

        Button("Green Button") { /* does nothing */ }
            .buttonStyle(.bruteReverse)
            .withLeveledBruteTheme(.green)
    }
    .padding()
}
