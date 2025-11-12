//
//  StrokeAndBorder.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension View {
    func brutalized() -> some View {
        self.bruteClipped().bruteStroked().bruteShadow()
    }

    func bruteClipped() -> some View {
        self.modifier(BruteClip())
    }

    func bruteStroked() -> some View {
        self.modifier(BruteStroke())
    }

    func bruteShadow() -> some View {
        self.modifier(BruteShadow())
    }
}

fileprivate struct BruteClip: ViewModifier {

    @Environment(\.bruteDimen) private var dimen

    func body(content: Content) -> some View {
        content.clipShape(
            RoundedRectangle(cornerRadius: dimen.cornerRadius)
        )
    }
}

fileprivate struct BruteStroke: ViewModifier {
    @Environment(\.bruteTheme) private var theme

    func body(content: Content) -> some View {
        content.overlay {
            RoundedRectangle(cornerRadius: theme.dimen.cornerRadius)
                .stroke(theme.color.border, lineWidth: theme.dimen.borderWidth)
        }
    }
}

fileprivate struct BruteShadow: ViewModifier {
    @Environment(\.bruteTheme) private var theme

    func body(content: Content) -> some View {
        content.background {
            RoundedRectangle(cornerRadius: theme.dimen.cornerRadius)
                .fill(theme.color.border)
                .offset(theme.dimen.shadowOffset)
        }
    }
}
