//
//  FormControlsDemo.swift
//  BruteSampleApp
//
//  Created by Lukas Simonson on 11/17/25.
//

import SwiftUI
import Brute

struct FormControlsDemo: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var gaugeValue = 0.75

    var body: some View {
        VStack(spacing: 20) {
            // Text Field
            VStack(alignment: .leading, spacing: 8) {
                Text(".brute TextField")
                    .font(.headline)
                Text("Animated shadow on focus")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                TextField("Username", text: $username)
                    .textFieldStyle(.brute)

                TextField("Email", text: $email)
                    .textFieldStyle(.brute)

                TextField("Password", text: $password)
                    .textFieldStyle(.brute)
            }

            Divider()

            // Disclosure Group
            VStack(alignment: .leading, spacing: 8) {
                Text(".brute DisclosureGroup")
                    .font(.headline)
                Text("Animated expand/collapse")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                DisclosureGroup {
                    Text("This content is hidden until expanded")
                        .padding()
                } label: {
                    Label("More Information", systemImage: "info.circle")
                }
                .disclosureGroupStyle(.brute)

                DisclosureGroup {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Line 1")
                        Text("Line 2")
                        Text("Line 3")
                    }
                    .padding()
                } label: {
                    Label("Details", systemImage: "list.bullet")
                }
                .disclosureGroupStyle(.brute)
            }

            Divider()

            // Gauge
            VStack(alignment: .leading, spacing: 8) {
                Text(".brute Gauge")
                    .font(.headline)
                Text("Progress gauge with filled bar")
                    .font(.caption)
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
        .padding()
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
