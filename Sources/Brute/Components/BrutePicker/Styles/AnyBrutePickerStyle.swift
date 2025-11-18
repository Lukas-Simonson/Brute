//
//  AnyBrutePickerStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/13/25.
//

import SwiftUI

extension EnvironmentValues {
    /// The current picker style applied to `BrutePicker` instances in the environment.
    ///
    /// Defaults to `.segmented`. Override using the `brutePickerStyle(_:)` modifier.
    @Entry
    var brutePickerStyle: AnyBrutePickerStyle = AnyBrutePickerStyle(.segmented)
}

extension View {
    /// Sets the style for `BrutePicker` instances within this view.
    ///
    /// Use this modifier to apply a custom picker style to all pickers in the view hierarchy.
    ///
    /// - Parameter style: The picker style to apply.
    /// - Returns: A view with the specified picker style applied to its environment.
    ///
    /// ## Example
    ///
    /// ```swift
    /// VStack {
    ///     BrutePicker(selection: $value) {
    ///         ForEach(options, id: \.self) { option in
    ///             Text(option)
    ///         }
    ///     }
    /// }
    /// .brutePickerStyle(.segmented)
    /// ```
    public func brutePickerStyle(_ style: some BrutePickerStyle) -> some View {
        self.environment(\.brutePickerStyle, AnyBrutePickerStyle(style))
    }
}

/// A type-erased wrapper for `BrutePickerStyle` conforming types.
///
/// This structure allows picker styles to be stored and passed through the environment
/// without exposing their concrete types, similar to how `AnyView` works for views.
/// You typically don't need to use this type directly; instead, use the `brutePickerStyle(_:)` modifier.
struct AnyBrutePickerStyle {
    typealias Configuration = BrutePickerStyleConfiguration
    typealias ChildConfiguration = BrutePickerStyleChildConfiguration

    /// Closure that creates the picker container view.
    private var _makeBody: @MainActor (Configuration) -> AnyView

    /// Closure that creates individual picker option views.
    private var _makeChild: @MainActor (ChildConfiguration) -> AnyView

    /// Creates a type-erased picker style from a concrete style.
    ///
    /// - Parameter style: A concrete picker style conforming to `BrutePickerStyle`.
    init(_ style: some BrutePickerStyle) {
        _makeBody = { AnyView(style.makeBody(config: $0)) }
        _makeChild = { AnyView(style.makeChild(config: $0)) }
    }

    /// Creates the picker container view using the wrapped style.
    ///
    /// - Parameter config: The configuration for the picker container.
    /// - Returns: A type-erased view representing the picker container.
    @MainActor
    func makeBody(config: Configuration) -> AnyView {
        _makeBody(config)
    }

    /// Creates a picker option view using the wrapped style.
    ///
    /// - Parameter config: The configuration for the picker option.
    /// - Returns: A type-erased view representing the picker option.
    @MainActor
    func makeChild(config: ChildConfiguration) -> AnyView {
        _makeChild(config)
    }
}
