//
//  FontSet.swift
//  Brute
//
//  Created by Lukas Simonson on 11/13/25.
//

import SwiftUI

extension BruteTheme {
    /// A set of typography styles defining font characteristics for a theme.
    ///
    /// `FontSet` provides semantic font values for different text hierarchies in your interface.
    /// These fonts work together to create consistent typographic hierarchy and readability.
    ///
    /// ## Usage
    ///
    /// Access fonts from the current theme context:
    ///
    /// ```swift
    /// @Environment(\.bruteContext) var theme
    ///
    /// VStack(alignment: .leading) {
    ///     Text("Title")
    ///         .font(theme.font.title)
    ///     Text("Body text")
    ///         .font(theme.font.body)
    /// }
    /// ```
    public struct FontSet {
        /// Large, prominent font for main titles and headings.
        public let title: Font

        /// Medium-weight font for section headers and subheadings.
        public let header: Font

        /// Regular font for body text and general content.
        public let body: Font

        /// Small font for captions, labels, and supporting text.
        public let caption: Font
    }
}

// MARK: - Predefined Font Sets

extension BruteTheme.FontSet {
    /// Violet theme font set with rounded system fonts and monospaced captions.
    ///
    /// - Title: Bold rounded system title
    /// - Header: Bold rounded headline
    /// - Body: Regular rounded body
    /// - Caption: Bold monospaced caption
    public static var violet: BruteTheme.FontSet {
        BruteTheme.FontSet(
            title: Font.system(.title, design: .rounded, weight: .bold),
            header: Font.system(.headline, design: .rounded, weight: .bold),
            body: Font.system(.body, design: .rounded, weight: .regular),
            caption: Font.system(.caption, design: .monospaced, weight: .bold)
        )
    }
}
