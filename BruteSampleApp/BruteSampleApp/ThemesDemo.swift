//
//  ThemesDemo.swift
//  BruteSampleApp
//
//  Created by Lukas Simonson on 11/17/25.
//

import SwiftUI
import Brute

struct ThemesDemo: View {
    var body: some View {
        VStack(spacing: 20) {
            // Multi-level theming
            VStack(alignment: .leading, spacing: 8) {
                Text("Multi-Level Theming")
                    .font(.headline)
                Text("Each nested level gets progressively darker variations")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                BruteCard {
                    Text("Level 0 (Default)")
                        .font(.title3)

                    BruteCard {
                        Text("Level 1 (Nested)")
                            .font(.body)

                        BruteCard {
                            Text("Level 2 (Double Nested)")
                                .font(.caption)
                        }
                    }
                }
            }

            Divider()

            // View Modifiers
            VStack(alignment: .leading, spacing: 12) {
                Text("View Modifiers")
                    .font(.headline)
                Text("Apply brutalist styling to any view")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text(".brutalized()")
                        .font(.subheadline)
                        .fontWeight(.semibold)

                    Text("Complete brutalist treatment")
                        .padding()
                        .brutalized()
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".brutalized(with:)")
                        .font(.subheadline)
                        .fontWeight(.semibold)

                    Text("With custom background")
                        .padding()
                        .brutalized(with: Color.purple.opacity(0.2))
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Individual Modifiers")
                        .font(.subheadline)
                        .fontWeight(.semibold)

                    HStack {
                        Text("Clipped")
                            .padding(8)
                            .background(Color.gray.opacity(0.2))
                            .bruteClipped()

                        Text("Stroked")
                            .padding(8)
                            .background(Color.gray.opacity(0.2))
                            .bruteClipped()
                            .bruteStroked()

                        Text("Shadow")
                            .padding(8)
                            .background(Color.gray.opacity(0.2))
                            .bruteClipped()
                            .bruteStroked()
                            .bruteShadow()
                    }
                }
            }

            Divider()

            // Theme Context
            VStack(alignment: .leading, spacing: 8) {
                Text("Accessing Theme Context")
                    .font(.headline)
                Text("Use @Environment to access theme values")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                CustomThemedView()
            }
        }
        .padding()
    }
}

struct CustomThemedView: View {
    @Environment(\.bruteContext) private var context

    var body: some View {
        VStack(spacing: 8) {
            Text("Custom View Using Theme Context")
                .foregroundStyle(context.color.accentForeground)
                .padding(context.dimen.paddingMedium)
                .background(context.color.accentBackground)
                .cornerRadius(context.dimen.cornerRadius)
                .overlay {
                    RoundedRectangle(cornerRadius: context.dimen.cornerRadius)
                        .stroke(context.color.border, lineWidth: context.dimen.borderWidth)
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
