//
//  BrutalistBadgeLabelStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/12/25.
//

import SwiftUI

extension LabelStyle where Self == BrutalistBadgeLabelStyle {
    public static var bruteBadge: Self { BrutalistBadgeLabelStyle(mode: .titleAndIcon) }
    public static func bruteBadge(_ mode: BrutalistBadgeLabelStyle.Mode) -> Self {
        BrutalistBadgeLabelStyle(mode: mode)
    }
}

public struct BrutalistBadgeLabelStyle: LabelStyle {

    @Environment(\.bruteTheme) private var theme
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
        .font(theme.font.caption)
        .padding(theme.dimen.smallContentPadding)
        .background(theme.color.secondaryBackground)
        .foregroundStyle(theme.color.secondaryForeground)
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

    @Environment(\.bruteTheme) private var theme

    let title: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(theme.font.header)

            HStack {
                Label("Icon Only", systemImage: "leaf")
                    .labelStyle(.bruteBadge(.iconOnly))
                
                Label("Title Only", systemImage: "person")
                    .labelStyle(.bruteBadge(.titleOnly))
                
                Label("Title & Icon", systemImage: "globe")
                    .labelStyle(.bruteBadge)
            }
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
                .bruteTheme(.violet)

            BrutalistBadgeLabelStylePreview(title: "Blue")
                .bruteTheme(.blue)

            BrutalistBadgeLabelStylePreview(title: "Orange")
                .bruteTheme(.orange)

            BrutalistBadgeLabelStylePreview(title: "Green")
                .bruteTheme(.green)
        }
        .padding()
    }
}
