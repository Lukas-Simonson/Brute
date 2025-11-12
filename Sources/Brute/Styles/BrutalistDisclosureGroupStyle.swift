//
//  BrutalistDisclosureGroupStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension DisclosureGroupStyle where Self == BrutalistDisclosureGroupStyle {
    static var brutalist: Self { BrutalistDisclosureGroupStyle() }
}

public struct BrutalistDisclosureGroupStyle: DisclosureGroupStyle {

    @Environment(\.bruteTheme) private var theme

    public func makeBody(configuration: Configuration) -> some View {
        VStack(spacing: 0) {
            header(with: configuration)
            if configuration.isExpanded {
                divider
                content(with: configuration)
            }
        }
        .brutified()
    }

    private func header(with config: Configuration) -> some View {
        HStack {
            config.label
            Spacer()
            Image(systemName: config.isExpanded ? "chevron.up" : "chevron.down")
                .contentTransition(.symbolEffect(.replace))
        }
        .font(theme.font.header)
        .padding()
        .background(theme.color.secondaryBackground)
        .onTapGesture {
            withAnimation(.default) {
                config.$isExpanded.wrappedValue = !config.isExpanded
            }
        }
        .zIndex(1)
    }

    private var divider: some View {
        Rectangle()
            .fill(theme.color.border)
            .frame(maxWidth: .infinity, maxHeight: theme.dimen.borderWidth)
            .transition(.move(edge: .top))
    }

    private func content(with config: Configuration) -> some View {
        config.content
            .transition(.move(edge: .top))
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(theme.color.background)
    }
}

#Preview {
    @Previewable @Environment(\.bruteTheme) var theme

    ScrollView {
        VStack {
            DisclosureGroup("Title Header") {
                Text("L\no\nn\ng\n\nB\no\nd\ny")
            }

            DisclosureGroup(
                content: {
                    Text("This uses a custom header.")
                },
                label: {
                    Label("Custom Header ", systemImage: "globe")
                }
            )
        }
        .padding()
        .disclosureGroupStyle(.brutalist)
    }
    .background(theme.color.background)
}
