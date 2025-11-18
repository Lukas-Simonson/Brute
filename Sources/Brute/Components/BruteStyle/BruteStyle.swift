//
//  BruteStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/13/25.
//

import SwiftUI

/// A container view that applies the full Brute design system styling to its content hierarchy.
///
/// `BruteStyle` is the primary wrapper for creating brutalist-styled interfaces. It automatically
/// applies a themed background with a characteristic grid pattern and sets default brutalist styles
/// for all standard SwiftUI components within its content.
///
/// ## Features
///
/// - Themed background with grid overlay pattern
/// - Automatic brutalist styling for all standard SwiftUI controls
/// - Background extends into safe area for full-screen coverage
/// - Applies consistent design system to the entire view hierarchy
///
/// ## Styled Components
///
/// The following SwiftUI components receive automatic brutalist styling when wrapped in `BruteStyle`:
/// - Buttons (`.brute` style)
/// - Disclosure groups (`.brute` style)
/// - Gauges (`.brute` style)
/// - Progress views (`.brute` style)
/// - Toggles (`.bruteSwitch` style)
///
/// ## Usage
///
/// Wrap your entire app or screen content in `BruteStyle`:
///
/// ```swift
/// BruteStyle {
///     VStack {
///         Text("Welcome")
///             .font(.title)
///
///         Button("Get Started") {
///             // Action
///         }
///
///         Toggle("Enable notifications", isOn: $notificationsEnabled)
///     }
///     .padding()
/// }
/// ```
///
/// Use with different themes:
///
/// ```swift
/// BruteStyle {
///     ContentView()
/// }
/// .bruteTheme(.orange)
/// ```
///
/// ## Styling
///
/// The container automatically applies:
/// - Theme background color (extends into safe area)
/// - Semi-transparent grid pattern overlay
/// - Default brutalist styles for all child controls
public struct BruteStyle<Content: View>: View {

    @Environment(\.bruteContext) var context

    /// The content to display with brutalist styling.
    @ViewBuilder
    public let content: () -> Content

    /// Creates a brutalist-styled container with the specified content.
    ///
    /// - Parameter content: A view builder that creates the content to be styled.
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    public var body: some View {
        ZStack {
            context.color.background
                .ignoresSafeArea()

            BruteGridShape(density: 8)
                .stroke(context.color.foreground.opacity(0.15), lineWidth: 1)
                .ignoresSafeArea()

            content()
        }
        .buttonStyle(.brute)
        .disclosureGroupStyle(.brute)
        .gaugeStyle(.brute)
        .progressViewStyle(.brute)
        .toggleStyle(.bruteSwitch)
    }
}

#Preview("BruteStyle") {
    BruteStyle {

    }
}
