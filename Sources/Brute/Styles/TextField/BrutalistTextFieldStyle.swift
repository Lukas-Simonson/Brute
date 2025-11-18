//
//  BrutalistTextFieldStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/12/25.
//

import SwiftUI

extension TextFieldStyle where Self == BrutalistTextFieldStyle {
    /// A brutalist text field style with focus-responsive shadow animation.
    public static var brute: Self { BrutalistTextFieldStyle() }
}

/// A text field style with neutral colors and animated shadow on focus.
///
/// Displays text input with neutral background and colors. When focused, an offset
/// shadow appears with smooth animation to indicate active state.
///
/// - Note: Apply this style directly to each `TextField` instance rather than to
///   a parent view containing multiple text fields.
///
/// - Warning: This style uses private SwiftUI APIs (`_body`) to function properly.
///   This may result in unintended side effects or unexpected behavior. Additionally,
///   applying this style multiple times to the same text field will cause unexpected
///   results. Avoid applying this style higher in the view hierarchy if individual
///   text fields also have the style applied directly.
///
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

