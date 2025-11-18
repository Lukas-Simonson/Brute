//
//  ProgressAndLabelsDemo.swift
//  BruteSampleApp
//
//  Created by Lukas Simonson on 11/17/25.
//

import SwiftUI
import Brute

struct ProgressAndLabelsDemo: View {

    @Environment(\.bruteContext) private var context

    var body: some View {
        VStack(alignment: .leading, spacing: context.dimen.paddingMedium) {
            // Progress Views - Determinate
            VStack(alignment: .leading, spacing: context.dimen.paddingSmall) {
                Text("ProgressView - Determinate")
                    .font(context.font.header)
                Text("Filled bar showing specific progress")
                    .font(context.font.caption)

                ProgressView("Loading", value: 0.25)
                    .progressViewStyle(.brute)

                ProgressView("Processing", value: 0.5)
                    .progressViewStyle(.brute)

                ProgressView("Almost Done", value: 0.75)
                    .progressViewStyle(.brute)
            }

            Divider()

            // Progress Views - Indeterminate
            VStack(alignment: .leading, spacing: context.dimen.paddingSmall) {
                Text("ProgressView - Indeterminate")
                    .font(context.font.header)
                Text("Animated chunky blocks")
                    .font(context.font.caption)

                ProgressView("Loading...")
                    .progressViewStyle(.brute)

                ProgressView("Processing...")
                    .progressViewStyle(.brute)
            }

            Divider()

            // Badge Labels
            VStack(alignment: .leading, spacing: context.dimen.paddingSmall) {
                Text(".bruteBadge Labels")
                    .font(context.font.header)
                Text("Accent-colored badges")
                    .font(context.font.caption)

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
            VStack(alignment: .leading, spacing: context.dimen.paddingSmall) {
                Text(".bruteBadgeNeutral Labels")
                    .font(context.font.header)
                Text("Neutral-colored badges for secondary info")
                    .font(context.font.caption)
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
