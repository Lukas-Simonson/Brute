//
//  BruteGridShape.swift
//  Brute
//
//  Created by Lukas Simonson on 11/13/25.
//

import SwiftUI

/// A Shape that displays a grid pattern based on a provided density.
///
/// The grid is rendered as a series of horizontal and vertical lines
/// that divide the available space into cells. The density determines
/// how many cells appear in the grid.
public struct BruteGridShape: Shape {
    
    /// The number of grid cells along the shorter dimension.
    /// The longer dimension will be calculated proportionally.
    public var density: Int
    
    /// The width of the grid lines.
    public var lineWidth: CGFloat
    
    /// Creates a grid shape with the specified density and line width.
    /// - Parameters:
    ///   - density: The number of grid cells along the shorter dimension. Default is 10.
    ///   - lineWidth: The width of the grid lines. Default is 1.
    public init(density: Int = 10, lineWidth: CGFloat = 1) {
        self.density = max(1, density) // Ensure at least 1
        self.lineWidth = lineWidth
    }
    
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Calculate cell size based on density
        // Use the shorter dimension to determine base cell size
        let shortestSide = min(rect.width, rect.height)
        let cellSize = shortestSide / CGFloat(density)
        
        // Calculate number of lines needed
        let verticalLines = Int(ceil(rect.width / cellSize)) + 1
        let horizontalLines = Int(ceil(rect.height / cellSize)) + 1
        
        // Draw vertical lines
        for i in 0..<verticalLines {
            let x = rect.minX + CGFloat(i) * cellSize
            if x <= rect.maxX {
                path.move(to: CGPoint(x: x, y: rect.minY))
                path.addLine(to: CGPoint(x: x, y: rect.maxY))
            }
        }
        
        // Draw horizontal lines
        for i in 0..<horizontalLines {
            let y = rect.minY + CGFloat(i) * cellSize
            if y <= rect.maxY {
                path.move(to: CGPoint(x: rect.minX, y: y))
                path.addLine(to: CGPoint(x: rect.maxX, y: y))
            }
        }
        
        return path
    }
}
