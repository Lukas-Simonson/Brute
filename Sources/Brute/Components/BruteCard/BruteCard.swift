//
//  BruteCard.swift
//  Brute
//
//  Created by Lukas Simonson on 11/12/25.
//

import SwiftUI

/// A styled container view that presents content in a card-like format with theme-aware styling.
///
/// `BruteCard` provides a consistent container design that automatically applies padding, background colors,
/// borders, and shadows based on the current theme. Content placed inside a card is automatically elevated
/// to the next theme level, creating visual hierarchy.
///
/// ## Usage
///
/// Basic card with text content:
///
/// ```swift
/// BruteCard {
///     Text("Card Title")
///         .font(.title)
///     Text("Card description goes here")
///         .font(.body)
/// }
/// ```
///
/// Card with form elements:
///
/// ```swift
/// BruteCard {
///     Text("Login")
///         .font(.title)
///     TextField("Email", text: $email)
///     TextField("Password", text: $password)
///     Button("Sign In") { /* action */ }
/// }
/// .textFieldStyle(.brute)
/// ```
///
/// ## Styling
///
/// The card automatically applies:
/// - Medium padding from the current theme
/// - Background color from the theme
/// - Border and shadow via the `brutalized()` modifier
/// - Nested content receives theme level + 1
public struct BruteCard<Content: View>: View {

    @Environment(\.bruteContext) private var context

    /// The content to display inside the card.
    @ViewBuilder
    public let content: () -> Content

    /// Creates a new card with the specified content.
    ///
    /// - Parameter content: A view builder that creates the card's content.
    ///   Content will be arranged in a vertical stack with medium spacing.
    public init(@ViewBuilder _ content: @escaping () -> Content ) {
        self.content = content
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: context.dimen.paddingMedium) {
            content()
                .bruteThemeLeveled(by: 1)
        }
        .padding(context.dimen.paddingMedium)
        .brutalized(with: context.color.background)
    }
}

#Preview {

    @Previewable @State var email = ""
    @Previewable @State var password = ""

    BruteStyle {
        ScrollView {
            BruteCard {
                Text("Login to your account")
                    .font(.title)
                Text("Enter your email below to login to your account")
                    .font(.subheadline)

                Spacer().frame(maxHeight: 16)

                TextField("Email", text: $email)
                TextField("Password", text: $password)

                Spacer().frame(maxHeight: 16)

                Button(action: { /* do nothing */ }, label: { Text("Login").frame(maxWidth: .infinity) })
                Button(action: { /* do nothing */ }, label: { Text("Google").frame(maxWidth: .infinity) })
                    .buttonStyle(.bruteNeutral)
            }
            .textFieldStyle(.brute)
            .padding()
        }
    }
}
