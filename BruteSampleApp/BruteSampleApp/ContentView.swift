//
//  ContentView.swift
//  BruteSampleApp
//
//  Created by Lukas Simonson on 11/17/25.
//

import Brute
import SwiftUI

struct ContentView: View {

    @Environment(\.bruteContext) private var theme

    @Binding var selectedTheme: ThemeOption

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: theme.dimen.paddingMedium) {
                    // Header
                    VStack(alignment: .leading, spacing: theme.dimen.paddingSmall) {
                        Text("Brute")
                            .font(.system(size: 48, weight: .black))
                        Text("Neo-Brutalist Design System")
                            .font(.headline)

                        // Theme selector
                        BrutePicker(selection: $selectedTheme) {
                            ForEach(ThemeOption.allCases, id: \.self) { theme in
                                Text(theme.rawValue.capitalized)
                            }
                        }
                    }
                    .padding(.top)

                    // Demo sections
                    VStack(spacing: theme.dimen.paddingMedium) {
                        DisclosureGroup {
                            ComponentsDemo()
                        } label: {
                            Label(
                                "Components",
                                systemImage: "square.stack.3d.up"
                            )
                        }

                        DisclosureGroup {
                            ButtonStylesDemo()
                        } label: {
                            Label("Buttons", systemImage: "hand.tap")
                        }

                        DisclosureGroup {
                            ToggleStylesDemo()
                        } label: {
                            Label("Toggles", systemImage: "switch.2")
                        }

                        DisclosureGroup {
                            FormControlsDemo()
                        } label: {
                            Label("Form Controls", systemImage: "pencil")
                        }

                        DisclosureGroup {
                            ProgressAndLabelsDemo()
                        } label: {
                            Label("Progress & Labels", systemImage: "chart.bar")
                        }

                        DisclosureGroup {
                            ThemesDemo()
                        } label: {
                            Label("Themes", systemImage: "paintpalette")
                        }
                    }
                    .disclosureGroupStyle(.brute)
                }
                .padding(theme.dimen.paddingMedium)
            }
            .background {
                BruteGridBackground()
            }
        }
    }
}

enum ThemeOption: String, CaseIterable, Hashable {
    case violet
    case blue
    case orange
    case green
    case multi

    var theme: BruteTheme {
        switch self {
            case .violet: return .violet
            case .blue: return .blue
            case .orange: return .orange
            case .green: return .green
            case .multi: return .multi
        }
    }
}

#Preview {
    BruteStyle {
        ContentView(selectedTheme: .constant(.violet))
    }
}
