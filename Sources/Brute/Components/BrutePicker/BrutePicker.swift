//
//  BrutePicker.swift
//  Brute
//
//  Created by Lukas Simonson on 11/12/25.
//

import SwiftUI

/// A customizable picker component for selecting between multiple options with theme-aware styling.
///
/// `BrutePicker` provides a brutalist-styled alternative to SwiftUI's native picker, offering a bold,
/// distinctive appearance that matches the Brute design system. It uses a style-based architecture
/// similar to SwiftUI's built-in components, allowing for customizable presentations.
///
/// ## Usage
///
/// Basic picker with string options:
///
/// ```swift
/// @State private var selection = "Account"
/// let options = ["Account", "Profile", "Settings"]
///
/// BrutePicker(selection: $selection) {
///     ForEach(options, id: \.self) { option in
///         Text(option)
///     }
/// }
/// ```
///
/// Picker with custom value types:
///
/// ```swift
/// enum Tab: String, Hashable, CaseIterable {
///     case home, profile, settings
/// }
///
/// @State private var selectedTab = Tab.home
///
/// BrutePicker(selection: $selectedTab) {
///     ForEach(Tab.allCases, id: \.self) { tab in
///         Text(tab.rawValue.capitalized)
///     }
/// }
/// ```
///
/// ## Styling
///
/// The picker's appearance is determined by the current `brutePickerStyle` environment value.
/// The default style is a segmented control-like presentation.
public struct BrutePicker<Value: Hashable, Content: View>: View {

    @Environment(\.self) private var environment: EnvironmentValues
    @Environment(\.brutePickerStyle) private var style

    /// The currently selected value.
    @Binding public var selection: Value

    /// The content containing the picker options.
    @ViewBuilder
    public let content: () -> Content

    /// Creates a picker with the specified selection binding and content.
    ///
    /// - Parameters:
    ///   - selection: A binding to the currently selected value.
    ///   - content: A view builder that creates the picker options. Each option should have a `.tag()` modifier.
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
