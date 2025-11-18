//
//  BruteNotice.swift
//  Brute
//
//  Created by Lukas Simonson on 11/17/25.
//

import SwiftUI

/// A prominent notice or alert component that displays important information with a title and content.
///
/// `BruteNotice` provides a visually distinct way to communicate messages, warnings, errors, or other
/// important information to users. It features a bold, eye-catching design with customizable colors
/// and automatic theme-aware styling.
///
/// ## Usage
///
/// Basic notice with text:
///
/// ```swift
/// BruteNotice("Welcome!") {
///     Text("This is an informational message")
/// }
/// ```
///
/// Notice with icon and custom color:
///
/// ```swift
/// BruteNotice("Success", systemImage: "checkmark.circle", fill: .green) {
///     Text("Your changes have been saved.")
/// }
/// ```
///
/// Notice with custom views:
///
/// ```swift
/// BruteNotice(
///     fill: .red,
///     title: { Label("Error", systemImage: "exclamationmark.triangle") },
///     content: {
///         VStack(alignment: .leading) {
///             Text("An error occurred")
///             Text("Please try again later")
///                 .font(.caption)
///         }
///     }
/// )
/// ```
///
/// ## Styling
///
/// The notice automatically applies:
/// - Accent foreground color for text
/// - Accent background color (or custom fill color if provided)
/// - Medium padding from the current theme
/// - Border and shadow via the `brutalized()` modifier
public struct BruteNotice<Title: View, Content: View>: View {

    @Environment(\.bruteContext) private var context

    /// Optional custom background color. If nil, uses the theme's accent background color.
    private let fill: Color?

    /// The title content displayed at the top of the notice.
    private let title: () -> Title

    /// The main content displayed below the title.
    private let content: () -> Content

    /// Creates a notice with custom title and content views.
    ///
    /// - Parameters:
    ///   - fill: Optional background color. If nil, uses the theme's accent background color.
    ///   - title: A view builder that creates the notice title.
    ///   - content: A view builder that creates the notice content.
    public init(
        fill: Color? = nil,
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.fill = fill
        self.title = title
        self.content = content
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: context.dimen.paddingSmall) {
            title()
                .font(context.font.header)
            content()
                .font(context.font.body)
        }
        .foregroundStyle(context.color.accentForeground)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(context.dimen.paddingMedium)
        .brutalized(with: fill ?? context.color.accentBackground)
    }
}

// MARK: - Convenience Initializers

extension BruteNotice {
    /// Creates a notice with a localized text title.
    ///
    /// - Parameters:
    ///   - titleKey: The localized string key for the title text.
    ///   - fill: Optional background color. If nil, uses the theme's accent background color.
    ///   - content: A view builder that creates the notice content.
    public init(_ titleKey: LocalizedStringKey, fill: Color? = nil, @ViewBuilder content: @escaping () -> Content) where Title == Text {
        self.fill = fill
        self.title = { Text(titleKey) }
        self.content = content
    }

    /// Creates a notice with a localized text title and an SF Symbol icon.
    ///
    /// - Parameters:
    ///   - titleKey: The localized string key for the title text.
    ///   - systemImage: The name of the SF Symbol to display alongside the title.
    ///   - fill: Optional background color. If nil, uses the theme's accent background color.
    ///   - content: A view builder that creates the notice content.
    public init(_ titleKey: LocalizedStringKey, systemImage: String, fill: Color? = nil, @ViewBuilder content: @escaping () -> Content) where Title == Label<Text, Image> {
        self.fill = fill
        self.title = { Label(titleKey, systemImage: systemImage) }
        self.content = content
    }
}

#Preview {
    BruteStyle {
        VStack {
            BruteNotice("Welcome!", systemImage: "person.fill") {
                Text("This is the beautiful style of Neo Brutalism")
            }

            BruteNotice("Success", systemImage: "checkmark.circle", fill: .green) {
                Text("Your changes have been saved.")
            }

            BruteNotice(
                fill: Color.yellow,
                title: { Label("Warning", systemImage: "exclamationmark.triangle.fill") },
                content: { Text("Saving these changes may result in loss of data") }
            )

            BruteNotice(
                fill: Color.red,
                title: { Label("Error", systemImage: "exclamationmark.warninglight.fill") },
                content: { Text("Saving these changes may result in loss of data") }
            )
        }
        .padding()
    }
}
