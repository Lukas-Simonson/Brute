//
//  PercentFillShape.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

/// A shape that fills a rectangle based on a percentage value with customizable alignment and corner radius.
///
/// `PercentFillShape` creates a filled portion of a rectangle that represents a percentage of completion
/// or progress. The fill can originate from the leading edge, trailing edge, or center, and supports
/// rounded corners for smooth visual presentation.
///
/// This shape is commonly used for progress bars, gauges, and visual indicators of completion status.
///
/// ## Features
///
/// - Percentage-based width (0.0 to 1.0)
/// - Automatic clamping of invalid percentage values
/// - Multiple alignment options (leading, trailing, center)
/// - Customizable corner radius
/// - Adaptive corner radius to prevent visual artifacts
///
/// ## Usage
///
/// Leading-aligned progress bar:
///
/// ```swift
/// PercentFillShape(percent: 0.75, alignment: .leading, cornerRadius: 8)
///     .fill(Color.blue)
///     .frame(height: 40)
/// ```
///
/// Center-aligned fill indicator:
///
/// ```swift
/// PercentFillShape(percent: 0.5, alignment: .center, cornerRadius: 12)
///     .fill(Color.green)
///     .frame(height: 30)
/// ```
///
/// Trailing-aligned progress:
///
/// ```swift
/// PercentFillShape(percent: 0.6, alignment: .trailing, cornerRadius: 0)
///     .fill(Color.orange)
///     .frame(height: 25)
/// ```
struct PercentFillShape: Shape {

    /// The fill percentage, clamped between 0.0 (empty) and 1.0 (full).
    var percent: Double

    /// The horizontal alignment determining where the fill originates.
    ///
    /// - `.leading` or `.listRowSeparatorLeading`: Fill from the left edge
    /// - `.trailing` or `.listRowSeparatorTrailing`: Fill from the right edge
    /// - `.center`: Fill from the center, expanding outward
    var alignment: HorizontalAlignment = .leading

    /// The corner radius for the filled portion.
    ///
    /// The actual corner radius used will be automatically adjusted if it exceeds
    /// half the height or width of the filled area to prevent visual artifacts.
    var cornerRadius: CGFloat

    /// Creates the path for the filled portion of the shape.
    ///
    /// - Parameter rect: The rectangle in which to draw the shape.
    /// - Returns: A path representing the filled portion based on the percentage and alignment.
    func path(in rect: CGRect) -> Path {
        // Clamp percent between 0 and 1
        let clampedPercent = min(max(percent, 0), 1)

        // Calculate the width based on percentage
        let fillWidth = rect.width * clampedPercent

        // Determine the fill rectangle based on alignment
        let fillRect: CGRect
        switch alignment {
        case .leading, .listRowSeparatorLeading:
            // Fill from left edge
            fillRect = CGRect(
                x: rect.minX,
                y: rect.minY,
                width: fillWidth,
                height: rect.height
            )
        case .trailing, .listRowSeparatorTrailing:
            // Fill from right edge
            fillRect = CGRect(
                x: rect.maxX - fillWidth,
                y: rect.minY,
                width: fillWidth,
                height: rect.height
            )
        case .center:
            // Fill from center, growing outward
            let halfWidth = fillWidth / 2
            fillRect = CGRect(
                x: rect.midX - halfWidth,
                y: rect.minY,
                width: fillWidth,
                height: rect.height
            )
        default:
            // Default to leading for any other alignment
            fillRect = CGRect(
                x: rect.minX,
                y: rect.minY,
                width: fillWidth,
                height: rect.height
            )
        }

        // Adjust corner radius if it's larger than half the height or width
        let effectiveCornerRadius = min(
            cornerRadius,
            min(fillRect.height / 2, fillRect.width / 2)
        )

        // Create a rounded rectangle for the filled portion
        let path = Path(
            roundedRect: fillRect,
            cornerRadius: effectiveCornerRadius
        )

        return path
    }
}

#Preview {
    VStack {
        PercentFillShape(percent: 0.5, alignment: .leading, cornerRadius: 15)
            .frame(maxHeight: 25)
            .border(Color.purple)

        PercentFillShape(percent: 0.25, alignment: .center, cornerRadius: 0)
            .frame(maxHeight: 25)
            .border(Color.blue)

        PercentFillShape(percent: 0.6, alignment: .trailing, cornerRadius: 5)
            .frame(maxHeight: 25)
            .border(Color.orange)

        PercentFillShape(percent: 0.75, alignment: .listRowSeparatorLeading, cornerRadius: 10)
            .frame(maxHeight: 25)
            .border(Color.green)
    }
    .padding()
}
