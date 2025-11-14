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

    @Environment(\.bruteContext) private var context

    public func makeBody(configuration: Configuration) -> some View {
        VStack {
            HStack {
                configuration.label
                Spacer()
            }

            if let label = configuration.currentValueLabel {
                label
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(context.dimen.paddingSmall)
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
        PercentFillShape(percent: value, cornerRadius: context.dimen.cornerRadius)
            .fill(context.color.accentBackground)
            .stroke(context.color.border, lineWidth: context.dimen.borderWidth)
            .background(context.color.background)
            .bruteClipped()
            .bruteStroked()
    }
}

#Preview {

    BruteStyle {
        VStack {
            Gauge(value: 0.5) {
                Text("Violet")
            }
            .gaugeStyle(.brute)
            .bruteTheme(.violet)
            // .bruteTheme(.violet)

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
            // .bruteTheme(.blue)

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

            Gauge(value: 0.66) {
                Text("Multi")
            }
            .bruteTheme(.multi)
        }
        .padding()
    }
}
