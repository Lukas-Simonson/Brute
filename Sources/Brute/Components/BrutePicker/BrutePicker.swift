//
//  BrutePicker.swift
//  Brute
//
//  Created by Lukas Simonson on 11/12/25.
//

import SwiftUI

public struct BrutePicker<Value: Hashable, ItemContent: View>: View {

    @Environment(\.bruteTheme) private var theme
    @Environment(\.brutePickerStyle) private var style

    @Binding public var selected: Value
    public var values: [Value]

    let itemContent: (Value) -> ItemContent

    public var body: some View {
        switch style {
            case .segmented: segmented
        }
    }
}

extension BrutePicker {
    private var segmented: some View {
        HStack(spacing: theme.dimen.smallContentPadding) {
            ForEach(values, id: \.self) { value in
                itemContent(value)
                    .frame(maxWidth: .infinity)
                    .padding(theme.dimen.smallContentPadding)
                    .background {
                        RoundedRectangle(cornerRadius: theme.dimen.cornerRadius)
                            .fill(value == selected ? theme.color.secondaryBackground : theme.color.background)
                            .stroke(value == selected ? theme.color.border : .clear, lineWidth: theme.dimen.borderWidth)
                            .animation(.linear(duration: 0.1), value: selected)
                    }
                    .onTapGesture {
                        selected = value
                    }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(theme.dimen.smallContentPadding)
        .background(theme.color.background)
        .bruteClipped()
        .bruteStroked()
    }
}

#Preview {

    @Previewable @State var selection = "Account"

    VStack {
        BrutePicker(selected: $selection, values: ["Account", "Password", "Other"]) { value in
            Text(value)
        }
    }
    .padding()
}
