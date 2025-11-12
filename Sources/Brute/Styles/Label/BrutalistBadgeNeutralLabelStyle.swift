//
//  BrutalistBadgeNeutralLabelStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/12/25.
//

import SwiftUI

extension LabelStyle where Self == BrutalistBadgeNeutralLabelStyle {
    public static var bruteBadgeNeutral: Self { BrutalistBadgeNeutralLabelStyle(mode: .titleAndIcon) }
    public static func bruteBadgeNeutral(_ mode: BrutalistBadgeLabelStyle.Mode) -> Self {
        BrutalistBadgeNeutralLabelStyle(mode: mode)
    }
}

public struct BrutalistBadgeNeutralLabelStyle: LabelStyle {

    @Environment(\.bruteTheme) private var theme
    public let mode: BrutalistBadgeLabelStyle.Mode

    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            switch mode {
                case .titleAndIcon:
                    configuration.icon
                    configuration.title
                case .titleOnly:
                    configuration.title
                case .iconOnly:
                    configuration.icon
            }
        }
        .font(theme.font.caption)
        .padding(theme.dimen.smallContentPadding)
        .background(theme.color.tertiaryBackground)
        .foregroundStyle(theme.color.tertiaryForeground)
        .bruteClipped()
        .bruteStroked()
    }
}

private struct BrutalistBadgeLabelStylePreview: View {

    @Environment(\.bruteTheme) private var theme

    let title: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(theme.font.header)

            Label("Icon Only", systemImage: "leaf")
                .labelStyle(.bruteBadgeNeutral(.iconOnly))

            Label("Title Only", systemImage: "person")
                .labelStyle(.bruteBadgeNeutral(.titleOnly))

            Label("Title & Icon", systemImage: "globe")
                .labelStyle(.bruteBadgeNeutral)
        }
        .padding(theme.dimen.contentPadding)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(theme.color.background)
        .brutalized()
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 30) {
            BrutalistBadgeLabelStylePreview(title: "Violet")
                .environment(\.bruteTheme, .violet)

            BrutalistBadgeLabelStylePreview(title: "Blue")
                .environment(\.bruteTheme, .blue)

            BrutalistBadgeLabelStylePreview(title: "Orange")
                .environment(\.bruteTheme, .orange)

            BrutalistBadgeLabelStylePreview(title: "Green")
                .environment(\.bruteTheme, .green)
        }
        .padding()
    }
}
