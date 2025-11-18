//
//  BrutePickerStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/12/25.
//

import SwiftUI

/// A protocol that defines the appearance and behavior of a `BrutePicker`.
///
/// Conform to this protocol to create custom picker styles that integrate with the Brute design system.
/// The protocol follows a similar pattern to SwiftUI's built-in style protocols like `ButtonStyle`,
/// allowing you to customize both the overall picker container and individual picker options.
///
/// ## Implementation
///
/// To create a custom picker style, implement both required methods:
///
/// ```swift
/// struct MyCustomPickerStyle: BrutePickerStyle {
///     func makeBody(config: Configuration) -> some View {
///         // Create the picker container
///         HStack {
///             config.children
///         }
///     }
///
///     func makeChild(config: ChildConfiguration) -> some View {
///         // Style each picker option
///         config.label
///             .padding()
///             .background(config.isSelected ? Color.blue : Color.gray)
///             .onTapGesture { config.isSelected = true }
///     }
/// }
/// ```
///
/// Apply your custom style using the `brutePickerStyle(_:)` modifier:
///
/// ```swift
/// BrutePicker(selection: $value) {
///     // Options
/// }
/// .brutePickerStyle(MyCustomPickerStyle())
/// ```
public protocol BrutePickerStyle: Sendable {
    /// The configuration type for the picker container.
    typealias Configuration = BrutePickerStyleConfiguration

    /// The configuration type for individual picker options.
    typealias ChildConfiguration = BrutePickerStyleChildConfiguration

    /// The view type representing the picker container.
    associatedtype Body: View

    /// The view type representing individual picker options.
    associatedtype Child: View

    /// Creates the view representing the picker container.
    ///
    /// - Parameter config: The configuration containing picker state and child options.
    /// - Returns: A view representing the styled picker container.
    @MainActor
    func makeBody(config: Configuration) -> Body

    /// Creates the view representing an individual picker option.
    ///
    /// - Parameter config: The configuration containing the option's label and selection state.
    /// - Returns: A view representing the styled picker option.
    @MainActor
    func makeChild(config: ChildConfiguration) -> Child
}

/// Configuration values for the picker container.
///
/// This structure contains the state and child options needed to render the picker container.
@MainActor
public struct BrutePickerStyleConfiguration {
    /// The current environment values, including the Brute theme context.
    let environment: EnvironmentValues

    /// The currently selected value (type-erased).
    let selection: AnyHashable

    /// The child picker options to be rendered.
    let children: Children

    /// A view containing all picker options.
    struct Children: View {
        let body: AnyView
    }
}

/// Configuration values for individual picker options.
///
/// This structure contains the label and selection state for a single picker option.
@MainActor
public struct BrutePickerStyleChildConfiguration {
    /// The current environment values, including the Brute theme context.
    let environment: EnvironmentValues

    /// The label view for this picker option.
    let label: Label

    /// A binding indicating whether this option is currently selected.
    ///
    /// Set this to `true` in a tap gesture or other interaction to select this option.
    @Binding var isSelected: Bool

    /// A view representing the picker option's label.
    struct Label: View {
        let body: AnyView
    }
}
