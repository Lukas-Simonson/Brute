//
//  ToggleStylesDemo.swift
//  BruteSampleApp
//
//  Created by Lukas Simonson on 11/17/25.
//

import SwiftUI
import Brute

struct ToggleStylesDemo: View {

    @Environment(\.bruteContext) private var theme

    @State private var checkbox1 = true
    @State private var checkbox2 = false
    @State private var switch1 = true
    @State private var switch2 = false

    var body: some View {
        VStack(spacing: theme.dimen.paddingMedium) {
            // Checkbox style
            VStack(alignment: .leading, spacing: theme.dimen.paddingSmall) {
                Text(".bruteCheckbox")
                    .font(theme.font.header)
                Text("Square checkbox with checkmark")
                    .font(theme.font.caption)

                VStack(alignment: .leading, spacing: theme.dimen.paddingMedium) {
                    Toggle("Enable notifications", isOn: $checkbox1)
                        .toggleStyle(.bruteCheckbox)

                    Toggle("Accept terms", isOn: $checkbox2)
                        .toggleStyle(.bruteCheckbox)
                }
            }

            Divider()

            // Switch style
            VStack(alignment: .leading, spacing: theme.dimen.paddingSmall) {
                Text(".bruteSwitch")
                    .font(theme.font.header)
                Text("Capsule switch with sliding circle")
                    .font(theme.font.caption)

                VStack(alignment: .leading, spacing: theme.dimen.paddingMedium) {
                    Toggle("Dark mode", isOn: $switch1)
                        .toggleStyle(.bruteSwitch)

                    Toggle("Airplane mode", isOn: $switch2)
                        .toggleStyle(.bruteSwitch)
                }
            }
        }
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
