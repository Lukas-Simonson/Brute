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

    @Environment(\.bruteContext) private var context

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(context.color.accentForeground)
            .padding(context.dimen.paddingMedium)
            .background(
                context.color.accentBackground
                    .opacity(configuration.isPressed ? 0.75 : 1)
            )
            .bruteClipped()
            .bruteStroked()
    }
}

#Preview {
    BruteStyle {
        VStack(spacing: 30) {
            Button("Violet Button") { /* does nothing */ }
                .bruteTheme(.violet)

            Button("Blue Button") { /* does nothing */ }
                .bruteTheme(.blue)

            Button("Orange Button") { /* does nothing */ }
                .bruteTheme(.orange)

            Button("Green Button") { /* does nothing */ }
                .bruteTheme(.green)
        }
        .buttonStyle(.bruteBasic)
    }
}
