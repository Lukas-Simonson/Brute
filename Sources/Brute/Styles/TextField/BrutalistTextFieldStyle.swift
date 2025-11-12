//
//  BrutalistTextFieldStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/12/25.
//

import SwiftUI

extension TextFieldStyle where Self == BrutalistTextFieldStyle {
    public static var brute: Self { BrutalistTextFieldStyle() }
}

public struct BrutalistTextFieldStyle: TextFieldStyle {

    @Environment(\.bruteTheme) private var theme
    @FocusState private var isFocused

    public func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .focused($isFocused)
            .padding(theme.dimen.contentPadding)
            .background(theme.color.tertiaryBackground)
            .foregroundStyle(theme.color.tertiaryForeground)
            .tint(theme.color.secondaryBackground)
            .bruteClipped()
            .bruteStroked()
            .padding(5)
            .background {
                if isFocused {
                    RoundedRectangle(cornerRadius: theme.dimen.cornerRadius)
                        .stroke(theme.color.border, lineWidth: theme.dimen.borderWidth)
                }
            }
            .onTapGesture {
                isFocused = true
            }
    }
}

#Preview {

    @Previewable @State var text = ""

    VStack {
        TextField("Violet", text: $text)
            .textFieldStyle(.brute)
            .environment(\.bruteTheme, .violet)

        TextField("Blue", text: $text)
            .textFieldStyle(.brute)
            .environment(\.bruteTheme, .blue)

        TextField("Orange", text: $text)
            .textFieldStyle(.brute)
            .environment(\.bruteTheme, .orange)

        TextField("Green", text: $text)
            .textFieldStyle(.brute)
            .environment(\.bruteTheme, .green)
    }
    .padding()
}

