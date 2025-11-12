//
//  PercentFillShape.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

struct PercentFillShape: Shape {

    // Some Value between Zero & One
    var percent: Double

    // Where the progress should start from. Leading & ListRowLeading / Trailing & ListRowTrailing can be treated the same.
    var alignment: HorizontalAlignment = .leading

    var cornerRadius: CGFloat

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
