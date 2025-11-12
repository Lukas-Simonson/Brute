//
//  BrutalistBasicButtonStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension ButtonStyle where Self == BrutalistBasicButtonStyle {
    public static var bruteBasic: Self { BrutalistBasicButtonStyle() }
}

public struct BrutalistBasicButtonStyle: ButtonStyle {

    @Environment(\.bruteTheme) private var theme

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(theme.color.secondaryForeground)
            .padding(theme.dimen.contentPadding)
            .background(
                theme.color.secondaryBackground
                    .opacity(configuration.isPressed ? 0.75 : 1)
            )
            .bruteClipped()
            .bruteStroked()
    }
}

#Preview {
    VStack(spacing: 30) {
        Button("Violet Button") { /* does nothing */ }
            .buttonStyle(.bruteBasic)
            .bruteTheme(.violet)

        Button("Blue Button") { /* does nothing */ }
            .buttonStyle(.bruteBasic)
            .bruteTheme(.blue)

        Button("Orange Button") { /* does nothing */ }
            .buttonStyle(.bruteBasic)
            .bruteTheme(.orange)

        Button("Green Button") { /* does nothing */ }
            .buttonStyle(.bruteBasic)
            .bruteTheme(.green)
    }
    .padding()
    .background(Color.gray)
}
