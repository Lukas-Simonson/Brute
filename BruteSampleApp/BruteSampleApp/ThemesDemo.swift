//
//  ThemesDemo.swift
//  BruteSampleApp
//
//  Created by Lukas Simonson on 11/17/25.
//

import Brute
import SwiftUI

struct ThemesDemo: View {

    @Environment(\.bruteContext) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.dimen.paddingMedium) {
            // Multi-level theming
            VStack(alignment: .leading, spacing: theme.dimen.paddingSmall) {
                Text("Multi-Level Theming")
                    .font(theme.font.header)
                Text("Each nested level gets progressively darker variations")
                    .font(theme.font.caption)

                Text("Level 0 (Default)")
                    .font(theme.font.header)

                BruteCard {
                    Text("Level 1 (Nested)")
                        .font(theme.font.body)

                    BruteCard {
                        Text("Level 2 (Double Nested)")
                            .font(theme.font.caption)
                    }
                }
            }

            Divider()

            // View Modifiers
            VStack(alignment: .leading, spacing: theme.dimen.paddingMedium) {
                Text("View Modifiers")
                    .font(theme.font.header)
                Text("Apply brutalist styling to any view")
                    .font(theme.font.caption)

                VStack(alignment: .leading, spacing: theme.dimen.paddingSmall) {
                    Text(".brutalized()")
                        .font(theme.font.header)

                    Text("Complete brutalist treatment")
                        .font(theme.font.caption)
                        .padding(theme.dimen.paddingSmall)
                        .background(theme.color.accentBackground)
                        .foregroundStyle(theme.color.accentForeground)
                        .brutalized()
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".brutalized(with:)")
                        .font(theme.font.header)

                    Text("With custom background")
                        .font(theme.font.caption)
                        .padding(theme.dimen.paddingSmall)
                        .foregroundStyle(theme.color.accentForeground)
                        .brutalized(with: theme.color.accentBackground)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Individual Modifiers")
                        .font(theme.font.header)

                    HStack {
                        Text("Clipped")
                            .padding(theme.dimen.paddingSmall)
                            .background(theme.color.accentBackground)
                            .foregroundStyle(theme.color.accentForeground)
                            .bruteClipped()

                        Text("Stroked")
                            .padding(theme.dimen.paddingSmall)
                            .background(theme.color.accentBackground)
                            .foregroundStyle(theme.color.accentForeground)
                            .bruteStroked()

                        Text("Shadow")
                            .padding(theme.dimen.paddingSmall)
                            .background(theme.color.accentBackground)
                            .foregroundStyle(theme.color.accentForeground)
                            .bruteShadow()
                    }
                }
            }

            Divider()

            // Theme Context
            VStack(alignment: .leading, spacing: theme.dimen.paddingSmall) {
                Text("Accessing Theme Context")
                    .font(theme.font.header)
                Text("Use @Environment to access theme values")
                    .font(theme.font.caption)

                CustomThemedView()
            }
        }
    }
}

struct CustomThemedView: View {
    @Environment(\.bruteContext) private var context

    var body: some View {
        VStack(spacing: context.dimen.paddingSmall) {
            Text("Custom View Using Theme Context")
                .foregroundStyle(context.color.accentForeground)
                .padding(context.dimen.paddingMedium)
                .background(context.color.accentBackground)
                .cornerRadius(context.dimen.cornerRadius)
                .overlay {
                    RoundedRectangle(cornerRadius: context.dimen.cornerRadius)
                        .stroke(
                            context.color.border,
                            lineWidth: context.dimen.borderWidth
                        )
                }

            Text("Uses context.color, context.dimen, and context.font")
                .font(context.font.caption)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    BruteStyle {
        ScrollView {
            ThemesDemo()
        }
        .bruteTheme(.violet)
    }
}
