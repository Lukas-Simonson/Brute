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

    @Environment(\.bruteContext) private var context

    public func makeBody(configuration: Configuration) -> some View {
        VStack(spacing: 0) {
            header(with: configuration)
            if configuration.isExpanded {
                divider
                content(with: configuration)
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
        .font(context.font.header)
        .foregroundStyle(context.color.accentForeground)
        .padding(context.dimen.paddingMedium)
        .background(context.color.accentBackground)
        .onTapGesture {
            withAnimation(.default) {
                config.$isExpanded.wrappedValue = !config.isExpanded
            }
        }
        .zIndex(1)
    }

    private var divider: some View {
        Rectangle()
            .fill(context.color.border)
            .frame(maxWidth: .infinity, maxHeight: context.dimen.borderWidth)
            .transition(.move(edge: .top))
    }

    private func content(with config: Configuration) -> some View {
        config.content
            .transition(.move(edge: .top))
            .padding(context.dimen.paddingMedium)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(context.color.background)
            .foregroundStyle(context.color.foreground)
            .bruteThemeLeveled(by: 1)
    }
}

#Preview {

    @Previewable @Environment(\.bruteColor) var color

    ScrollView {
        VStack(spacing: 30) {
            BrutalistDisclosureGroupStylePreview(title: "Violet")
                .bruteTheme(.violet)

            BrutalistDisclosureGroupStylePreview(title: "Blue")
                .bruteTheme(.blue)

            BrutalistDisclosureGroupStylePreview(title: "Orange")
                .bruteTheme(.orange)

            BrutalistDisclosureGroupStylePreview(title: "Green")
                .bruteTheme(.green)
        }
        .padding()
    }
    .background(Color.primary.colorInvert())
}

fileprivate struct BrutalistDisclosureGroupStylePreview: View {

    @Environment(\.bruteContext) private var context

    @State private var customExpanded = true

    let title: String

    var body: some View {
        DisclosureGroup(
            isExpanded: $customExpanded,
            content: {
                DisclosureGroup("Title Header | Level 2") {
                    DisclosureGroup("Title Header | Level 3") {
                        Text("L\no\nn\ng\n\nB\no\nd\ny")
                    }
                    .disclosureGroupStyle(.brute)
                }
                .disclosureGroupStyle(.brute)
            },
            label: {
                Label("Custom Header | Level 1", systemImage: "globe")
            }
        )
        .disclosureGroupStyle(.brute)
//        VStack {
//            BruteCard {
//                Text(title)
//                    .font(context.font.title)
//
//                DisclosureGroup(
//                    isExpanded: $customExpanded,
//                    content: {
//                        DisclosureGroup("Title Header") {
//                            Text("L\no\nn\ng\n\nB\no\nd\ny")
//                        }
//                        .disclosureGroupStyle(.brute)
//                    },
//                    label: {
//                        Label("Custom Header ", systemImage: "globe")
//                    }
//                )
//            }
//
//            DisclosureGroup("Title Header") {
//                Text("L\no\nn\ng\n\nB\no\nd\ny")
//            }
//        }
//        .disclosureGroupStyle(.brute)
    }
}
