//
//  ProgressAndLabelsDemo.swift
//  BruteSampleApp
//
//  Created by Lukas Simonson on 11/17/25.
//

import SwiftUI
import Brute

struct ProgressAndLabelsDemo: View {
    var body: some View {
        VStack(spacing: 20) {
            // Progress Views - Determinate
            VStack(alignment: .leading, spacing: 8) {
                Text("ProgressView - Determinate")
                    .font(.headline)
                Text("Filled bar showing specific progress")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                ProgressView("Loading", value: 0.25)
                    .progressViewStyle(.brute)

                ProgressView("Processing", value: 0.5)
                    .progressViewStyle(.brute)

                ProgressView("Almost Done", value: 0.75)
                    .progressViewStyle(.brute)
            }

            Divider()

            // Progress Views - Indeterminate
            VStack(alignment: .leading, spacing: 8) {
                Text("ProgressView - Indeterminate")
                    .font(.headline)
                Text("Animated chunky blocks")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                ProgressView("Loading...")
                    .progressViewStyle(.brute)

                ProgressView("Processing...")
                    .progressViewStyle(.brute)
            }

            Divider()

            // Badge Labels
            VStack(alignment: .leading, spacing: 8) {
                Text(".bruteBadge Labels")
                    .font(.headline)
                Text("Accent-colored badges")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                HStack {
                    Label("New", systemImage: "star.fill")
                        .labelStyle(.bruteBadge)

                    Label("Hot", systemImage: "flame.fill")
                        .labelStyle(.bruteBadge)

                    Label("Featured", systemImage: "sparkles")
                        .labelStyle(.bruteBadge)
                }

                HStack {
                    Label("Icon Only", systemImage: "heart.fill")
                        .labelStyle(.bruteBadge(.iconOnly))

                    Label("Title Only", systemImage: "text.bubble")
                        .labelStyle(.bruteBadge(.titleOnly))
                }
            }

            Divider()

            // Neutral Badge Labels
            VStack(alignment: .leading, spacing: 8) {
                Text(".bruteBadgeNeutral Labels")
                    .font(.headline)
                Text("Neutral-colored badges for secondary info")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                HStack {
                    Label("Draft", systemImage: "doc")
                        .labelStyle(.bruteBadgeNeutral)

                    Label("Archived", systemImage: "archivebox")
                        .labelStyle(.bruteBadgeNeutral)

                    Label("Info", systemImage: "info.circle")
                        .labelStyle(.bruteBadgeNeutral)
                }
            }
        }
        .padding()
    }
}

#Preview {
    BruteStyle {
        ScrollView {
            ProgressAndLabelsDemo()
        }
        .bruteTheme(.violet)
    }
}
