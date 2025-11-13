//
//  BrutePicker.swift
//  Brute
//
//  Created by Lukas Simonson on 11/12/25.
//

import SwiftUI

public struct BrutePicker<Value: Hashable, Content: View>: View {

    @Environment(\.self) private var environment: EnvironmentValues
    @Environment(\.brutePickerStyle) private var style

    @Binding public var selection: Value

    @ViewBuilder
    public let content: () -> Content

    public init(selection: Binding<Value>, @ViewBuilder content: @escaping () -> Content) {
        self._selection = selection
        self.content = content
    }

    public var body: some View {
        style.makeBody(config: AnyBrutePickerStyle.Configuration(
            environment: environment,
            selection: AnyHashable(selection),
            children: BrutePickerStyleConfiguration.Children(body: AnyView(children))
        ))
    }

    private var children: some View {
        ForEach(subviews: content()) { child in
            let tag = child.containerValues.tag(for: Value.self)

            style.makeChild(config: AnyBrutePickerStyle.ChildConfiguration(
                environment: environment,
                label: BrutePickerStyleChildConfiguration.Label(body: AnyView(child)),
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
