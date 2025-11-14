//
//  StrokeAndBorder.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension View {
    nonisolated func brutalized() -> some View {
        self.bruteClipped().bruteStroked().bruteShadow()
    }

    nonisolated func bruteClipped() -> some View {
        self.modifier(BruteClip())
    }

    nonisolated func bruteStroked() -> some View {
        self.modifier(BruteStroke())
    }

    nonisolated func bruteShadow() -> some View {
        self.modifier(BruteShadow())
    }
}

fileprivate struct BruteClip: ViewModifier {

    @Environment(\.bruteContext) private var context

    // Not sure why this is randomly needed
    nonisolated init() { }

    func body(content: Content) -> some View {
        content.clipShape(
            RoundedRectangle(cornerRadius: context.dimen.cornerRadius)
        )
    }
}

fileprivate struct BruteStroke: ViewModifier {
    @Environment(\.bruteContext) private var context

    // Not sure why this is randomly needed
    nonisolated init() { }

    func body(content: Content) -> some View {
        content.overlay {
            RoundedRectangle(cornerRadius: context.dimen.cornerRadius)
                .stroke(context.color.border, lineWidth: context.dimen.borderWidth)
        }
    }
}

fileprivate struct BruteShadow: ViewModifier {
    @Environment(\.bruteContext) private var context

    // Not sure why this is randomly needed
    nonisolated init() { }

    func body(content: Content) -> some View {
        content.background {
            RoundedRectangle(cornerRadius: context.dimen.cornerRadius)
                .fill(context.color.border)
                .offset(context.dimen.shadowOffset)
        }
    }
}
