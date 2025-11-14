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

    @Environment(\.bruteContext) private var context
    @FocusState private var isFocused

    public func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .focused($isFocused)
            .padding(context.dimen.paddingMedium)
            .background(context.color.neutralBackground)
            .foregroundStyle(context.color.neutralForeground)
            .tint(context.color.accentBackground)
            .bruteClipped()
            .bruteStroked()
            .background {
                RoundedRectangle(cornerRadius: context.dimen.cornerRadius)
                    .fill(context.color.border)
                    .offset(isFocused ? context.dimen.shadowOffset : .zero)
            }
            .animation(.default, value: isFocused)
            .onTapGesture {
                isFocused = true
            }
    }
}

#Preview {

    @Previewable @State var text = ""

    BruteStyle {
        VStack {
            TextField("Violet", text: $text)
                .bruteTheme(.violet)

            TextField("Blue", text: $text)
                .bruteTheme(.blue)

            TextField("Orange", text: $text)
                .bruteTheme(.orange)

            TextField("Green", text: $text)
                .bruteTheme(.green)
        }
        .padding()
        .textFieldStyle(.brute)
    }
}

