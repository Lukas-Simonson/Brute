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

    @Environment(\.bruteContext) private var context

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(context.dimen.paddingMedium)
            .foregroundStyle(context.color.neutralForeground)
            .background(context.color.neutralBackground)
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
}
