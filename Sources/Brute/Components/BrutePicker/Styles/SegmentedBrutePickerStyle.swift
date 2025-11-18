//
//  SegmentedBrutePickerStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/13/25.
//

import SwiftUI
import Flow

extension BrutePickerStyle where Self == SegmentedBrutePickerStyle {
    /// A segmented control-style picker with options arranged in a flowing layout.
    ///
    /// This is the default picker style in the Brute design system.
    public static var segmented: Self { SegmentedBrutePickerStyle() }
}

/// A picker style that displays options as a segmented control with brutalist styling.
///
/// `SegmentedBrutePickerStyle` presents picker options in a horizontal flowing layout where
/// each option appears as a tappable segment. The selected segment is highlighted with the
/// theme's accent color, while unselected segments use the standard foreground color.
///
/// ## Features
///
/// - Flowing horizontal layout that wraps to multiple lines when needed
/// - Theme-aware colors and dimensions
/// - Smooth selection animation
/// - Bold borders and clear visual hierarchy
/// - Tap gesture support for selection
///
/// ## Usage
///
/// Apply this style using the `.segmented` static property:
///
/// ```swift
/// BrutePicker(selection: $selectedOption) {
///     ForEach(options, id: \.self) { option in
///         Text(option)
///     }
/// }
/// .brutePickerStyle(.segmented)
/// ```
///
/// This is the default style, so it's applied automatically unless overridden.
///
/// ## Styling
///
/// The style automatically applies:
/// - Flowing layout with small spacing between options
/// - Small padding inside the picker container
/// - Border and clipping via `bruteClipped()` and `bruteStroked()`
/// - Selected options: accent background and foreground colors
/// - Unselected options: standard background and foreground colors
/// - Rounded corners based on the theme's dimension set
public struct SegmentedBrutePickerStyle: BrutePickerStyle {

    /// Creates the picker container view with a flowing horizontal layout.
    ///
    /// - Parameter config: The configuration containing picker state and child options.
    /// - Returns: A view representing the picker container.
    public func makeBody(config: Configuration) -> some View {
        let context = config.environment.bruteContext

        return HFlow(spacing: context.dimen.paddingSmall) {
            config.children
        }
        .animation(.linear(duration: 0.1), value: config.selection)
        .padding(context.dimen.paddingSmall)
        .background(context.color.background)
        .bruteClipped()
        .bruteStroked()
    }

    /// Creates an individual picker option view.
    ///
    /// - Parameter config: The configuration containing the option's label and selection state.
    /// - Returns: A view representing the styled picker option with tap gesture support.
    public func makeChild(config: ChildConfiguration) -> some View {
        let context = config.environment.bruteContext

        return config.label
            .frame(maxWidth: .infinity)
            .padding(context.dimen.paddingSmall)
            .foregroundStyle(config.isSelected ? context.color.accentForeground : context.color.foreground)
            .background {
                RoundedRectangle(cornerRadius: context.dimen.cornerRadius)
                    .fill(config.isSelected ? context.color.accentBackground : context.color.background)
                    .stroke(config.isSelected ? context.color.border : .clear, lineWidth: context.dimen.borderWidth)
            }
            .onTapGesture { config.isSelected = true }
    }
}

#Preview {
    @Previewable @State var selection = "Account"
    let tabs = ["Account", "Profile", "Settings", "Social Media", "Now Playing"]

    BruteStyle {
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
        .brutePickerStyle(.segmented)
        .padding()
    }
}
