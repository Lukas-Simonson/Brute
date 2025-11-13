//
//  BrutePicker.swift
//  Brute
//
//  Created by Lukas Simonson on 11/12/25.
//

import SwiftUI

public struct BrutePicker<Value: Hashable, Content: View>: View {

    @Environment(\.bruteTheme) private var theme
    @Environment(\.brutePickerStyle) private var style

    @Binding public var selection: Value

    @ViewBuilder
    public let content: () -> Content

    public init(selection: Binding<Value>, @ViewBuilder content: @escaping () -> Content) {
        self._selection = selection
        self.content = content
    }

    public var body: some View {
        style.makeBody(config: .init(
            theme: theme,
            selection: AnyHashable(selection),
            children: children.erased(),
        ))
    }

    private var children: some View {
        ForEach(subviews: content()) { child in
            let tag = child.containerValues.tag(for: Value.self)

            style.makeChild(config: .init(
                theme: theme,
                view: child.erased(),
                isSelected: Binding(
                    get: { selection == tag },
                    set: { if $0, let tag { selection = tag } }
                )
            ))
        }
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
