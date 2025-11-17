//
//  BruteNotice.swift
//  Brute
//
//  Created by Lukas Simonson on 11/17/25.
//

import SwiftUI

public struct BruteNotice<Title: View, Content: View>: View {

    @Environment(\.bruteContext) private var context

    private let fill: Color?

    private let title: () -> Title
    private let content: () -> Content

    public init(
        fill: Color? = nil,
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.fill = fill
        self.title = title
        self.content = content
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: context.dimen.paddingSmall) {
            title()
                .font(context.font.header)
            content()
                .font(context.font.body)
        }
        .foregroundStyle(context.color.accentForeground)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(context.dimen.paddingMedium)
        .background(fill ?? context.color.accentBackground)
        .brutalized()
    }
}

// MARK: - Convenience Inits
extension BruteNotice {
    public init(_ titleKey: LocalizedStringKey, fill: Color? = nil, @ViewBuilder content: @escaping () -> Content) where Title == Text {
        self.fill = fill
        self.title = { Text(titleKey) }
        self.content = content
    }

    public init(_ titleKey: LocalizedStringKey, systemImage: String, fill: Color? = nil, @ViewBuilder content: @escaping () -> Content) where Title == Label<Text, Image> {
        self.fill = fill
        self.title = { Label(titleKey, systemImage: systemImage) }
        self.content = content
    }
}

#Preview {
    BruteStyle {
        VStack {
            BruteNotice("Welcome!", systemImage: "person.fill") {
                Text("This is the beautiful style of Neo Brutalism")
            }

            BruteNotice("Success", systemImage: "checkmark.circle", fill: .green) {
                Text("Your changes have been saved.")
            }

            BruteNotice(
                fill: Color.yellow,
                title: { Label("Warning", systemImage: "exclamationmark.triangle.fill") },
                content: { Text("Saving these changes may result in loss of data") }
            )

            BruteNotice(
                fill: Color.red,
                title: { Label("Error", systemImage: "exclamationmark.warninglight.fill") },
                content: { Text("Saving these changes may result in loss of data") }
            )
        }
        .padding()
    }
}
