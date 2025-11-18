//
//  FormControlsDemo.swift
//  BruteSampleApp
//
//  Created by Lukas Simonson on 11/17/25.
//

import SwiftUI
import Brute

struct FormControlsDemo: View {

    @Environment(\.bruteContext) private var theme

    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var gaugeValue = 0.75

    var body: some View {
        VStack(spacing: theme.dimen.paddingMedium) {
            // Text Field
            VStack(alignment: .leading, spacing: theme.dimen.paddingMedium) {
                Text(".brute TextField")
                    .font(theme.font.header)
                Text("Animated shadow on focus")
                    .font(theme.font.caption)

                TextField("Username", text: $username)
                    .textFieldStyle(.brute)

                TextField("Email", text: $email)
                    .textFieldStyle(.brute)

                TextField("Password", text: $password)
                    .textFieldStyle(.brute)
            }

            Divider()

            // Disclosure Group
            VStack(alignment: .leading, spacing: theme.dimen.paddingSmall) {
                Text(".brute DisclosureGroup")
                    .font(theme.font.header)
                Text("Animated expand/collapse")
                    .font(theme.font.caption)

                DisclosureGroup {
                    Text("This content is hidden until expanded")
                } label: {
                    Label("More Information", systemImage: "info.circle")
                }
                .disclosureGroupStyle(.brute)

                DisclosureGroup {
                    VStack(alignment: .leading, spacing: theme.dimen.paddingSmall) {
                        Text("Line 1")
                        Text("Line 2")
                        Text("Line 3")
                    }
                } label: {
                    Label("Details", systemImage: "list.bullet")
                }
                .disclosureGroupStyle(.brute)
            }

            Divider()

            // Gauge
            VStack(alignment: .leading, spacing: theme.dimen.paddingSmall) {
                Text(".brute Gauge")
                    .font(theme.font.header)
                Text("Progress gauge with filled bar")
                    .font(theme.font.caption)
                    .foregroundStyle(.secondary)

                Gauge(value: gaugeValue) {
                    Text("Progress")
                } currentValueLabel: {
                    Text("\(Int(gaugeValue * 100))%")
                }
                .gaugeStyle(.brute)

                Gauge(value: 0.5) {
                    Text("50%")
                }
                .gaugeStyle(.brute)
            }
        }
    }
}

#Preview {
    BruteStyle {
        ScrollView {
            FormControlsDemo()
        }
        .bruteTheme(.violet)
    }
}
