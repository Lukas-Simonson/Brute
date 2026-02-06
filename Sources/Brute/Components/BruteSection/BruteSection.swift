//
//  BruteSection.swift
//  Brute
//
//  Created by Lukas Simonson on 2/6/26.
//

import SwiftUI

public struct BruteSection<Title: View, Content: View>: View {

    @Environment(\.bruteContext) private var context
    
    private let title: () -> Title
    private let content: () -> Content
    
    public var body: some View {
        VStack(spacing: 0) {
            header
            divider
            contentBody
        }
        .brutalized()
    }
    
    private var header: some View {
        HStack {
            title()
            Spacer()
        }
        .font(context.font.header)
        .foregroundStyle(context.color.accentForeground)
        .padding(context.dimen.paddingMedium)
        .background(context.color.accentBackground)
    }
    
    private var divider: some View {
        Rectangle()
            .fill(context.color.border)
            .frame(maxWidth: .infinity, minHeight: context.dimen.borderWidth, maxHeight: context.dimen.borderWidth)
    }
    
    private var contentBody: some View {
        content()
            .padding(context.dimen.paddingMedium)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(context.color.background)
            .foregroundStyle(context.color.foreground)
            .bruteThemeLeveled(by: 1)
    }
}

public extension BruteSection {
    init(
        _ titleKey: LocalizedStringKey,
        @ViewBuilder content: @escaping () -> Content
    ) where Title == Text {
        self.title = { Text(titleKey) }
        self.content = content
    }
    
    init(
        titleResource: LocalizedStringResource,
        @ViewBuilder content: @escaping () -> Content
    ) where Title == Text {
        self.title = { Text(titleResource) }
        self.content = content
    }
    
    init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder content: @escaping () -> Content
    ) where Title == Text {
        self.title = title
        self.content = content
    }
}

#Preview {
    BruteStyle {
        ScrollView {
            VStack {
                BruteSection("Hello, World") {
                    Text("Goodbye, World")
                }
                
                BruteSection(
                    title: {
                        Text("Hello")
                    },
                    content: {
                        Text("Goodbye")
                    }
                )
            }
            .padding()
        }
    }
}
