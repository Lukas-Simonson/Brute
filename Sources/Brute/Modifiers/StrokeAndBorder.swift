//
//  StrokeAndBorder.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension View {
    /// Applies the complete brutalist styling treatment to the view.
    ///
    /// This convenience modifier combines clipping, stroke, and shadow effects to create
    /// the characteristic brutalist aesthetic. It's equivalent to calling `bruteClipped()`,
    /// `bruteStroked()`, and `bruteShadow()` in sequence.
    ///
    /// The brutalized style features:
    /// - Rounded rectangle clipping based on theme corner radius
    /// - Bold border stroke using theme border color and width
    /// - Offset shadow for depth and dimension
    ///
    /// ## Usage
    ///
    /// ```swift
    /// VStack {
    ///     Text("Hello, World!")
    ///         .padding()
    /// }
    /// .background(Color.white)
    /// .brutalized()
    /// ```
    ///
    /// - Returns: A view with brutalist clipping, stroke, and shadow applied.
    public nonisolated func brutalized() -> some View {
        self.bruteClipped().bruteStroked().bruteShadow()
    }

    /// Applies the complete brutalist styling treatment with a custom background fill.
    ///
    /// This variation combines a background fill with clipping, stroke, and shadow effects
    /// to create the characteristic brutalist aesthetic. It's a convenience for applying
    /// a background color or gradient before the brutalist treatment.
    ///
    /// ## Usage
    ///
    /// With a solid color:
    ///
    /// ```swift
    /// VStack {
    ///     Text("Hello, World!")
    ///         .padding()
    /// }
    /// .brutalized(with: Color.white)
    /// ```
    ///
    /// With a gradient:
    ///
    /// ```swift
    /// Text("Gradient Card")
    ///     .padding()
    ///     .brutalized(with: LinearGradient(
    ///         colors: [.purple, .blue],
    ///         startPoint: .topLeading,
    ///         endPoint: .bottomTrailing
    ///     ))
    /// ```
    ///
    /// - Parameter fill: The shape style to use as the background fill.
    /// - Returns: A view with the background fill and brutalist styling applied.
    public nonisolated func brutalized(with fill: some ShapeStyle) -> some View {
        self.background(fill).bruteClipped().bruteStroked().bruteShadow()
    }

    /// Clips the view to a rounded rectangle shape based on the current theme.
    ///
    /// Applies corner radius clipping using the theme's `cornerRadius` dimension value.
    /// Use this when you want rounded corners without the border or shadow effects.
    ///
    /// ## Usage
    ///
    /// ```swift
    /// Image("photo")
    ///     .bruteClipped()
    /// ```
    ///
    /// - Returns: A view clipped to a rounded rectangle.
    public nonisolated func bruteClipped() -> some View {
        self.modifier(BruteClip())
    }

    /// Adds a bold border stroke around the view based on the current theme.
    ///
    /// Applies a rounded rectangle stroke using the theme's `border` color and `borderWidth`.
    /// The stroke is drawn as an overlay, so it won't affect the view's layout size.
    ///
    /// ## Usage
    ///
    /// ```swift
    /// Rectangle()
    ///     .fill(Color.blue)
    ///     .frame(width: 100, height: 100)
    ///     .bruteStroked()
    /// ```
    ///
    /// - Returns: A view with a border stroke overlay.
    public nonisolated func bruteStroked() -> some View {
        self.modifier(BruteStroke())
    }

    /// Adds an offset shadow behind the view based on the current theme.
    ///
    /// Creates a shadow effect by placing a filled rounded rectangle behind the view,
    /// offset according to the theme's `shadowOffset` value. This creates the characteristic
    /// brutalist depth effect.
    ///
    /// ## Usage
    ///
    /// ```swift
    /// VStack {
    ///     Text("Card Content")
    /// }
    /// .background(Color.white)
    /// .bruteShadow()
    /// ```
    ///
    /// - Returns: A view with an offset shadow background.
    public nonisolated func bruteShadow() -> some View {
        self.modifier(BruteShadow())
    }
}

// MARK: - View Modifiers

/// A view modifier that clips content to a rounded rectangle shape using theme values.
fileprivate struct BruteClip: ViewModifier {

    @Environment(\.bruteContext) private var context

    // Not sure why this is randomly needed
    nonisolated init() { }

    func body(content: Content) -> some View {
        content.clipShape(
            RoundedRectangle(cornerRadius: context.dimen.cornerRadius)
        )
    }
}

/// A view modifier that adds a border stroke to content using theme values.
fileprivate struct BruteStroke: ViewModifier {
    @Environment(\.bruteContext) private var context

    // Not sure why this is randomly needed
    nonisolated init() { }

    func body(content: Content) -> some View {
        content.overlay {
            RoundedRectangle(cornerRadius: context.dimen.cornerRadius)
                .stroke(context.color.border, lineWidth: context.dimen.borderWidth)
        }
    }
}

/// A view modifier that adds an offset shadow behind content using theme values.
fileprivate struct BruteShadow: ViewModifier {
    @Environment(\.bruteContext) private var context

    // Not sure why this is randomly needed
    nonisolated init() { }

    func body(content: Content) -> some View {
        content.background {
            RoundedRectangle(cornerRadius: context.dimen.cornerRadius)
                .fill(context.color.border)
                .offset(context.dimen.shadowOffset)
        }
    }
}
