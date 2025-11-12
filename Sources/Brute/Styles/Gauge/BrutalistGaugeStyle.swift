//
//  BrutalistGaugeStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension GaugeStyle where Self == BrutalistGaugeStyle {
    public static var brute: Self { BrutalistGaugeStyle() }
}

public struct BrutalistGaugeStyle: GaugeStyle {

    @Environment(\.bruteTheme) private var theme

    public func makeBody(configuration: Configuration) -> some View {
        VStack {
            HStack {
                configuration.label
                Spacer()
            }

            if let label = configuration.currentValueLabel {
                label
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(theme.dimen.smallContentPadding)
                    .background(progressView(value: configuration.value))
            } else {
                progressView(value: configuration.value)
                    .frame(height: 20)
            }

            HStack {
                configuration.minimumValueLabel
                Spacer()
                configuration.maximumValueLabel
            }
        }
    }

    private func progressView(value: Double) -> some View {
        PercentFillShape(percent: value, cornerRadius: theme.dimen.cornerRadius)
            .fill(theme.color.secondaryBackground)
            .stroke(theme.color.border, lineWidth: theme.dimen.borderWidth)
            .background(theme.color.tertiaryBackground)
            .bruteClipped()
            .bruteStroked()
    }
}

#Preview {

    @Previewable @Environment(\.bruteTheme) var theme

    VStack {
        Gauge(value: 0.5) {
            Text("Violet")
        }
        .gaugeStyle(.brute)
        .bruteTheme(.violet)

        Gauge(
            value: 0.09,
            label: {
                Text("Blue")
            },
            currentValueLabel: {
                Text("15%")
            },
            minimumValueLabel: {
                Text("0%")
            },
            maximumValueLabel: {
                Text("100%")
            }
        )
        .gaugeStyle(.brute)
        .bruteTheme(.blue)

        Gauge(value: 0.5) {
            Text("Orange")
        }
        .gaugeStyle(.brute)
        .bruteTheme(.orange)

        Gauge(
            value: 0.75,
            label: {
                Text("Green")
            },
            currentValueLabel: {
                Text("75%")
            },
            minimumValueLabel: {
                Text("0%")
            },
            maximumValueLabel: {
                Text("100%")
            }
        )
        .gaugeStyle(.brute)
        .bruteTheme(.green)
    }
    .padding()
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(theme.color.background)
}
