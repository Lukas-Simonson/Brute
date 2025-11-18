//
//  ButtonStylesDemo.swift
//  BruteSampleApp
//
//  Created by Lukas Simonson on 11/17/25.
//

import SwiftUI
import Brute

struct ButtonStylesDemo: View {

    @Environment(\.bruteContext) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.dimen.paddingMedium) {
            // .brute style
            VStack(alignment: .leading, spacing: theme.dimen.paddingSmall) {
                Text(".brute")
                    .font(theme.font.header)
                Text("Shadow animates on press")
                    .font(theme.font.caption)
                    .foregroundStyle(theme.color.foreground)

                HStack {
                    Button("Tap Me") { }
                        .buttonStyle(.brute)

                    Button("Press") { }
                        .buttonStyle(.brute)

                    Button("Click") { }
                        .buttonStyle(.brute)
                }
            }

            Divider()

            VStack(alignment: .leading, spacing: theme.dimen.paddingSmall) {
                Text(".bruteBasic")
                    .font(theme.font.header)
                Text("Opacity-based press feedback")
                    .font(theme.font.caption)
                    .foregroundStyle(theme.color.foreground)

                HStack {
                    Button("Tap Me") { }
                        .buttonStyle(.bruteBasic)

                    Button("Press") { }
                        .buttonStyle(.bruteBasic)

                    Button("Click") { }
                        .buttonStyle(.bruteBasic)
                }
            }

            Divider()

            // .bruteNeutral style
            VStack(alignment: .leading, spacing: theme.dimen.paddingSmall) {
                Text(".bruteNeutral")
                    .font(theme.font.header)
                Text("Neutral colors for secondary actions")
                    .font(theme.font.caption)
                    .foregroundStyle(theme.color.foreground)

                HStack {
                    Button("Tap Me") { }
                        .buttonStyle(.bruteNeutral)

                    Button("Press") { }
                        .buttonStyle(.bruteNeutral)

                    Button("Click") { }
                        .buttonStyle(.bruteNeutral)
                }
            }

            Divider()

            // .bruteReverse style
            VStack(alignment: .leading, spacing: theme.dimen.paddingSmall) {
                Text(".bruteReverse")
                    .font(theme.font.header)
                Text("Shadow movies instead of button")
                    .font(theme.font.caption)
                    .foregroundStyle(theme.color.foreground)

                HStack {
                    Button("Tap Me") { }
                        .buttonStyle(.bruteReverse)

                    Button("Press") { }
                        .buttonStyle(.bruteReverse)

                    Button("Click") { }
                        .buttonStyle(.bruteReverse)
                }
            }
        }
    }
}

#Preview {
    BruteStyle {
        ScrollView {
            ButtonStylesDemo()
        }
        .bruteTheme(.violet)
    }
}
