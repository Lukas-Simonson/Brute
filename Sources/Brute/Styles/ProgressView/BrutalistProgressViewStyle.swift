//
//  BrutalistProgressViewStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension ProgressViewStyle where Self == BrutalistProgressViewStyle {
    public static var brute: Self { BrutalistProgressViewStyle() }
}

public struct BrutalistProgressViewStyle: ProgressViewStyle {

    @Environment(\.bruteTheme) var theme

    public func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label

            if let fractionCompleted = configuration.fractionCompleted {
                // Determinate progress view
                PercentFillShape(percent: fractionCompleted, cornerRadius: theme.dimen.cornerRadius)
                    .fill(theme.color.secondaryBackground)
                    .stroke(theme.color.border, lineWidth: theme.dimen.borderWidth)
                    .frame(height: 20)
                    .background(theme.color.tertiaryBackground)
                    .bruteClipped()
                    .bruteStroked()
            } else {
                // Indeterminate progress view
                IndeterminateProgressView()
                    .frame(height: 20)
                    .background(theme.color.tertiaryBackground)
                    .bruteClipped()
                    .bruteStroked()
            }
        }
    }
}

/// An indeterminate progress view with a Neo-Brutalist chunky animated pattern
fileprivate struct IndeterminateProgressView: View {
    @Environment(\.bruteTheme) var theme
    @State private var animationOffset: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            TimelineView(.animation) { timeline in
                Canvas { context, size in
                    // Draw chunky blocks that move across
                    let blockWidth: CGFloat = 20
                    let blockHeight = size.height
                    let spacing: CGFloat = 15
                    let totalBlockWidth = blockWidth + spacing
                    
                    // Calculate animated offset based on timeline
                    let timeOffset = timeline.date.timeIntervalSinceReferenceDate
                    let animationSpeed = 1.0 // Blocks per second
                    let currentOffset = (timeOffset * animationSpeed * totalBlockWidth).truncatingRemainder(dividingBy: totalBlockWidth)

                    // Calculate how many blocks we need to fill the view plus overflow for animation
                    let numberOfBlocks = Int(ceil(size.width / totalBlockWidth)) + 2
                    
                    for i in 0..<numberOfBlocks {
                        let xPosition = CGFloat(i) * totalBlockWidth + currentOffset - totalBlockWidth
                        
                        // Only draw blocks that are visible (with some margin)
                        if xPosition + blockWidth >= -blockWidth && xPosition <= size.width + blockWidth {
                            let rect = CGRect(
                                x: xPosition,
                                y: 0,
                                width: blockWidth,
                                height: blockHeight
                            )
                            
                            let cornerRadius = min(theme.dimen.cornerRadius, blockWidth / 2)
                            let path = Path(roundedRect: rect, cornerRadius: cornerRadius)
                            
                            context.fill(path, with: .color(theme.color.secondaryBackground))
                            context.stroke(
                                path,
                                with: .color(theme.color.border),
                                lineWidth: theme.dimen.borderWidth
                            )
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @Environment(\.bruteTheme) var theme

    VStack {
        ProgressView("Violet", value: 0.25)
            .progressViewStyle(.brute)
            .bruteTheme(.violet)

        ProgressView("Loading Violet...")
            .progressViewStyle(.brute)
            .bruteTheme(.violet)

        ProgressView("Blue", value: 0.5)
            .progressViewStyle(.brute)
            .bruteTheme(.blue)

        ProgressView("Loading Blue...")
            .progressViewStyle(.brute)
            .bruteTheme(.blue)

        ProgressView("Orange", value: 0.75)
            .progressViewStyle(.brute)
            .bruteTheme(.orange)

        ProgressView("Loading Orange...")
            .progressViewStyle(.brute)
            .bruteTheme(.orange)

        ProgressView("Green", value: 1)
            .progressViewStyle(.brute)
            .bruteTheme(.green)

        ProgressView("Loading Green...")
            .progressViewStyle(.brute)
            .bruteTheme(.green)
    }
    .padding()
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(theme.color.background)
}
