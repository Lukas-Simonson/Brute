//
//  BrutalistBadgeNeutralLabelStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/12/25.
//

import SwiftUI

extension LabelStyle where Self == BrutalistBadgeNeutralLabelStyle {
    /// A badge-style label with neutral colors displaying title and/or icon.
    public static var bruteBadgeNeutral: Self { BrutalistBadgeNeutralLabelStyle(mode: .titleAndIcon) }
    /// A badge-style label with neutral colors and custom display mode.
    public static func bruteBadgeNeutral(_ mode: BrutalistBadgeLabelStyle.Mode) -> Self {
        BrutalistBadgeNeutralLabelStyle(mode: mode)
    }
}

/// A compact badge-style label with neutral colors for secondary tags and indicators.
///
/// Similar to `BrutalistBadgeLabelStyle` but uses neutral colors instead of accent colors,
/// making it suitable for less prominent labels and secondary information.
public struct BrutalistBadgeNeutralLabelStyle: LabelStyle {

    @Environment(\.bruteContext) private var context
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
        .font(context.font.caption)
        .padding(context.dimen.paddingSmall)
        .background(context.color.neutralBackground)
        .foregroundStyle(context.color.neutralForeground)
        .bruteClipped()
        .bruteStroked()
    }
}

private struct BrutalistBadgeLabelStylePreview: View {

    @Environment(\.bruteContext) private var context

    let title: String

    var body: some View {
        BruteCard {
            Text(title)
                .font(context.font.title)

            HStack {
                Label("Icon Only", systemImage: "leaf")
                    .labelStyle(.bruteBadgeNeutral(.iconOnly))

                Label("Title Only", systemImage: "person")
                    .labelStyle(.bruteBadgeNeutral(.titleOnly))

                Label("Title & Icon", systemImage: "globe")
                    .labelStyle(.bruteBadgeNeutral)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 30) {
            BrutalistBadgeLabelStylePreview(title: "Violet")
                .bruteTheme(.violet)

            BrutalistBadgeLabelStylePreview(title: "Blue")
                .bruteTheme(.blue)

            BrutalistBadgeLabelStylePreview(title: "Orange")
                .bruteTheme(.orange)

            BrutalistBadgeLabelStylePreview(title: "Green")
                .bruteTheme(.green)

            BrutalistBadgeLabelStylePreview(title: "Multi")
                .bruteTheme(.multi)
        }
        .padding()
    }
}
