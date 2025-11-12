//
//  Accordion.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

public struct Accordion<Header: View, Content: View>: View {

    @Environment(\.bruteTheme) private var theme

    @State private var isExpanded = false
    @Binding private var isExpandedBinding: Bool

    private let headerContent: () -> Header
    private let bodyContent: () -> Content

    public var body: some View {
        VStack(spacing: 0) {
            header
            if isExpanded {
                divider
                content
            }
        }
        .brutified()
        .onChange(of: isExpanded) { _, newValue in
            // TODO: Find a better way to sync isExpanded with a provided binding...
            isExpandedBinding = newValue
        }
    }

    private var header: some View {
        HStack {
            headerContent()
            Spacer()
            Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                .contentTransition(.symbolEffect(.replace))
        }
        .font(theme.font.header)
        .padding()
        .background(theme.color.secondaryBackground)
        .onTapGesture {
            withAnimation(.default) {
                isExpanded = !isExpanded
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

    private var content: some View {
        bodyContent()
            .transition(.move(edge: .top))
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(theme.color.background)
    }
}

// MARK: Initializers
extension Accordion {
    public init(
        header: @escaping () -> Header,
        content: @escaping () -> Content
    ) {
        self._isExpandedBinding = .constant(false)
        self.headerContent = header
        self.bodyContent = content
    }

    public init(
        title: LocalizedStringKey,
        content: @escaping () -> Content
    ) where Header == Text {
        self._isExpandedBinding = .constant(false)
        self.headerContent = { Text(title) }
        self.bodyContent = content
    }

    public init(
        isExpanded: Binding<Bool>,
        header: @escaping () -> Header,
        content: @escaping () -> Content
    ) {
        // TODO: Find a better way to sync isExpanded with a provided binding...
        self._isExpanded = State(initialValue: isExpanded.wrappedValue)
        self._isExpandedBinding = isExpanded
        self.headerContent = header
        self.bodyContent = content
    }

    public init(
        title: LocalizedStringKey,
        isExpanded: Binding<Bool>,
        content: @escaping () -> Content
    ) where Header == Text {
        // TODO: Find a better way to sync isExpanded with a provided binding...
        self._isExpanded = State(initialValue: isExpanded.wrappedValue)
        self._isExpandedBinding = isExpanded
        self.headerContent = { Text(title) }
        self.bodyContent = content
    }
}

#Preview {

    @Previewable @Environment(\.bruteTheme) var theme
    @Previewable @State var firstExpanded = true
    @Previewable @State var secondExpanded = false

    ScrollView {
        VStack {
            Accordion(
                header: {
                    Label("Custom Header", systemImage: "globe")
                },
                content: {
                    VStack(alignment: .leading) {
                        Image(systemName: "globe")
                        Text("This has a custom header")
                    }
                }
            )

            Accordion(title: "Title Header") {
                Text("This has a title header")
            }

            Accordion(
                isExpanded: $firstExpanded,
                header: {
                    Label("Custom Header & Binding", systemImage: "sharedwithyou")
                },
                content: {
                    Text("L\no\nn\ng\n\nB\no\nd\ny")
                }
            )

            Accordion(title: "Title Header & Binding", isExpanded: $secondExpanded) {
                Text("Another Shorty")
            }
        }
        .padding()
    }
    .background(theme.color.background)
}
