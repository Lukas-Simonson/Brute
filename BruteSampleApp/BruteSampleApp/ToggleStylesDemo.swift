//
//  ToggleStylesDemo.swift
//  BruteSampleApp
//
//  Created by Lukas Simonson on 11/17/25.
//

import SwiftUI
import Brute

struct ToggleStylesDemo: View {
    @State private var checkbox1 = true
    @State private var checkbox2 = false
    @State private var switch1 = true
    @State private var switch2 = false

    var body: some View {
        VStack(spacing: 20) {
            // Checkbox style
            VStack(alignment: .leading, spacing: 8) {
                Text(".bruteCheckbox")
                    .font(.headline)
                Text("Square checkbox with checkmark")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 12) {
                    Toggle("Enable notifications", isOn: $checkbox1)
                        .toggleStyle(.bruteCheckbox)

                    Toggle("Accept terms", isOn: $checkbox2)
                        .toggleStyle(.bruteCheckbox)
                }
            }

            Divider()

            // Switch style
            VStack(alignment: .leading, spacing: 8) {
                Text(".bruteSwitch")
                    .font(.headline)
                Text("Capsule switch with sliding circle")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 12) {
                    Toggle("Dark mode", isOn: $switch1)
                        .toggleStyle(.bruteSwitch)

                    Toggle("Airplane mode", isOn: $switch2)
                        .toggleStyle(.bruteSwitch)
                }
            }
        }
        .padding()
    }
}

#Preview {
    BruteStyle {
        ScrollView {
            ToggleStylesDemo()
        }
        .bruteTheme(.violet)
    }
}
