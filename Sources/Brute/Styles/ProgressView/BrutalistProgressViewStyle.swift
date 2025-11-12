//
//  BrutalistProgressViewStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension ProgressViewStyle where Self == BrutalistProgressViewStyle {
    static var brutalist: Self { BrutalistProgressViewStyle() }
}

public struct BrutalistProgressViewStyle: ProgressViewStyle {

    @Environment(\.bruteTheme) var theme

    public func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label

            // TODO: Implement a non-progress based progress view.
            PercentFillShape(percent: configuration.fractionCompleted ?? 0.0, cornerRadius: theme.dimen.cornerRadius)
                .fill(theme.color.secondaryBackground)
                .stroke(theme.color.border, lineWidth: theme.dimen.borderWidth)
                .frame(maxHeight: 20)
                .background(theme.color.tertiaryBackground)
                .bruteClipped()
                .bruteStroked()
        }
    }
}

#Preview {
    @Previewable @Environment(\.bruteTheme) var theme

    VStack {
        ProgressView("Violet", value: 0.25)
            .progressViewStyle(.brutalist)
            .environment(\.bruteTheme, .violet)

        ProgressView("Blue", value: 0.5)
            .progressViewStyle(.brutalist)
            .environment(\.bruteTheme, .blue)

        ProgressView("Orange", value: 0.75)
            .progressViewStyle(.brutalist)
            .environment(\.bruteTheme, .orange)

        ProgressView("Green", value: 1)
            .progressViewStyle(.brutalist)
            .environment(\.bruteTheme, .green)
    }
    .padding()
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(theme.color.background)
}
