//
//  BrutePicker.swift
//  Brute
//
//  Created by Lukas Simonson on 11/12/25.
//

import SwiftUI

public struct BrutePicker<Value: Hashable, Content: View>: View {

    @Environment(\.bruteTheme) private var theme

    @Binding public var selection: Value

    @ViewBuilder
    public let content: () -> Content

    public init(selection: Binding<Value>, @ViewBuilder content: @escaping () -> Content) {
        self._selection = selection
        self.content = content
    }

    public var body: some View {
        HStack(spacing: theme.dimen.smallContentPadding) {
            ForEach(subviews: content()) { childView in
                let tag = childView.containerValues.tag(for: Value.self)

                childView
                    .frame(maxWidth: .infinity)
                    .padding(theme.dimen.smallContentPadding)
                    .background {
                        RoundedRectangle(cornerRadius: theme.dimen.cornerRadius)
                            .fill(tag == selection ? theme.color.secondaryBackground : theme.color.background)
                            .stroke(tag == selection ? theme.color.border : .clear, lineWidth: theme.dimen.borderWidth)
                    }
                    .onTapGesture { selection = tag ?? selection }

            }
            .animation(.linear(duration: 0.1), value: selection)
        }
        .padding(theme.dimen.smallContentPadding)
        .background(theme.color.background)
        .bruteClipped()
        .bruteStroked()
    }
}

#Preview {
    @Previewable @State var selection = "Account"
    let tabs = ["Account", "Profile", "Settings"]

    VStack {
        BrutePicker(selection: $selection) {
            ForEach(tabs, id: \.self) { value in
                Text(value)
            }
        }.bruteTheme(.violet)

        BrutePicker(selection: $selection) {
            ForEach(tabs, id: \.self) { value in
                Text(value)
            }
        }.bruteTheme(.blue)

        BrutePicker(selection: $selection) {
            ForEach(tabs, id: \.self) { value in
                Text(value)
            }
        }.bruteTheme(.orange)

        BrutePicker(selection: $selection) {
            ForEach(tabs, id: \.self) { value in
                Text(value)
            }
        }.bruteTheme(.green)
    }
    .padding()
}
