//
//  Color+8Bit.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension Color {
    /// Creates a color using 8-bit RGB values (0-255).
    ///
    /// This convenience initializer allows you to create colors using the more common 8-bit RGB
    /// representation (where each component ranges from 0 to 255) instead of SwiftUI's default
    /// floating-point format (0.0 to 1.0).
    ///
    /// - Parameters:
    ///   - r: The red component (0-255).
    ///   - g: The green component (0-255).
    ///   - b: The blue component (0-255).
    ///
    /// - Precondition: All values must be within the range 0-255. Values outside this range
    ///   will trigger an assertion failure in debug builds.
    ///
    /// ## Usage
    ///
    /// ```swift
    /// // Create a bright red color
    /// let red = Color(r: 255, g: 0, b: 0)
    ///
    /// // Create a purple color
    /// let purple = Color(r: 128, g: 0, b: 128)
    ///
    /// // Create a custom brand color
    /// let brandColor = Color(r: 170, g: 133, b: 255)
    /// ```
    ///
    /// ## Note
    ///
    /// This is particularly useful when working with color values from design tools,
    /// CSS, or other systems that use 8-bit RGB notation.
    init(r: Int, g: Int, b: Int) {
        assert([r, g, b].allSatisfy { (0...255).contains($0) }, "Provided values must range between 0 and 255")
        self = Color(red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255)
    }
}
