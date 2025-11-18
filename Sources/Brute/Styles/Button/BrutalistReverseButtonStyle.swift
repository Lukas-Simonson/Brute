//
//  BrutalistReverseButtonStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension ButtonStyle where Self == BrutalistReverseButtonStyle {
    /// A brutalist button style with inverted press animation where the shadow moves.
    public static var bruteReverse: Self { BrutalistReverseButtonStyle() }
}

/// A button style with accent colors where the shadow moves on press instead of the button.
///
/// This creates an alternative press effect where the shadow slides under the button
/// when pressed, rather than the button moving toward the shadow.
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
