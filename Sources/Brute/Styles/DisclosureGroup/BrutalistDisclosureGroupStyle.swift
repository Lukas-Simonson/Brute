//
//  BrutalistDisclosureGroupStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension DisclosureGroupStyle where Self == BrutalistDisclosureGroupStyle {
    public static var brute: Self { BrutalistDisclosureGroupStyle() }
}

public struct BrutalistDisclosureGroupStyle: DisclosureGroupStyle {

    @Environment(\.bruteTheme) private var theme

    public func makeBody(configuration: Configuration) -> some View {
        VStack(spacing: 0) {
            header(with: configuration)
            if configuration.isExpanded {
                divider
                content(with: configuration)
                    .foregroundStyle(theme.color.foreground)
            }
        }
        .brutalized()
    }

    private func header(with config: Configuration) -> some View {
        HStack {
            config.label
            Spacer()
            Image(systemName: config.isExpanded ? "chevron.up" : "chevron.down")
                .contentTransition(.symbolEffect(.replace))
        }
        .font(theme.font.header)
        .foregroundStyle(theme.color.secondaryForeground)
        .padding(theme.dimen.contentPadding)
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
            .padding(theme.dimen.contentPadding)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(theme.color.background)
    }
}

#Preview {

    @Previewable @Environment(\.bruteColor) var color

    ScrollView {
        VStack(spacing: 30) {
            BrutalistDisclosureGroupStylePreview(title: "Violet")
                .environment(\.bruteTheme, BruteTheme.violet)

            BrutalistDisclosureGroupStylePreview(title: "Blue")
                .environment(\.bruteTheme, BruteTheme.blue)

            BrutalistDisclosureGroupStylePreview(title: "Orange")
                .environment(\.bruteTheme, BruteTheme.orange)

            BrutalistDisclosureGroupStylePreview(title: "Green")
                .environment(\.bruteTheme, BruteTheme.green)
        }
        .padding()
    }
    .background(color.background)
}

fileprivate struct BrutalistDisclosureGroupStylePreview: View {

    @Environment(\.bruteColor) private var color

    @State private var customExpanded = true

    let title: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .foregroundStyle(color.foreground)

            DisclosureGroup(
                isExpanded: $customExpanded,
                content: {
                    Text("This uses a custom header.")
                },
                label: {
                    Label("Custom Header ", systemImage: "globe")
                }
            )

            DisclosureGroup("Title Header") {
                Text("L\no\nn\ng\n\nB\no\nd\ny")
            }
        }
        .padding()
        .background(color.background)
        .disclosureGroupStyle(.brute)
        .brutalized()
    }
}
