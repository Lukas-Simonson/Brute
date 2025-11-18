//
//  BrutalistNeutralButtonStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension ButtonStyle where Self == BrutalistNeutralButtonStyle {
    /// A brutalist button style using neutral colors instead of accent colors.
    public static var bruteNeutral: Self { BrutalistNeutralButtonStyle() }
}

/// A button style with neutral colors for secondary actions.
///
/// Similar to the default brute style but uses neutral foreground and background colors,
/// making it suitable for secondary or less prominent actions.
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
