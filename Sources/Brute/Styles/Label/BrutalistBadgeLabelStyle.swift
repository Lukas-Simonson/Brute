//
//  BrutalistBadgeLabelStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/12/25.
//

import SwiftUI

extension LabelStyle where Self == BrutalistBadgeLabelStyle {
    public static var bruteBadge: Self {
        BrutalistBadgeLabelStyle(mode: .titleAndIcon)
    }
    public static func bruteBadge(_ mode: BrutalistBadgeLabelStyle.Mode) -> Self {
        BrutalistBadgeLabelStyle(mode: mode)
    }
}

public struct BrutalistBadgeLabelStyle: LabelStyle {

    @Environment(\.bruteContext) private var context
    public let mode: Mode

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
        .background(context.color.accentBackground)
        .foregroundStyle(context.color.accentForeground)
        .bruteClipped()
        .bruteStroked()
    }

    public enum Mode {
        case titleAndIcon
        case titleOnly
        case iconOnly
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
                    .labelStyle(.bruteBadge(.iconOnly))

                Label("Title Only", systemImage: "person")
                    .labelStyle(.bruteBadge(.titleOnly))

                Label("Title & Icon", systemImage: "globe")
                    .labelStyle(.bruteBadge)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    BruteStyle {
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
}
