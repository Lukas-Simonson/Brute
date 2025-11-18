//
//  ContentView.swift
//  BruteSampleApp
//
//  Created by Lukas Simonson on 11/17/25.
//

import Brute
import SwiftUI

struct ContentView: View {

    @Environment(\.colorScheme) private var colorScheme

    @State private var selectedTheme: ThemeOption = .violet

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Header
                    VStack(spacing: 12) {
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
                    VStack(spacing: 20) {
                        DisclosureGroup {
                            ComponentsDemo()
                        } label: {
                            Label(
                                "Components",
                                systemImage: "square.stack.3d.up"
                            )
                        }
                        .disclosureGroupStyle(.brute)

                        DisclosureGroup {
                            ButtonStylesDemo()
                        } label: {
                            Label("Buttons", systemImage: "hand.tap")
                        }
                        .disclosureGroupStyle(.brute)

                        DisclosureGroup {
                            ToggleStylesDemo()
                        } label: {
                            Label("Toggles", systemImage: "switch.2")
                        }
                        .disclosureGroupStyle(.brute)

                        DisclosureGroup {
                            FormControlsDemo()
                        } label: {
                            Label("Form Controls", systemImage: "pencil")
                        }
                        .disclosureGroupStyle(.brute)

                        DisclosureGroup {
                            ProgressAndLabelsDemo()
                        } label: {
                            Label("Progress & Labels", systemImage: "chart.bar")
                        }
                        .disclosureGroupStyle(.brute)

                        DisclosureGroup {
                            ThemesDemo()
                        } label: {
                            Label("Themes", systemImage: "paintpalette")
                        }
                        .disclosureGroupStyle(.brute)
                    }
                }
                .padding()
            }
            .background {
                BruteGridBackground()
            }
        }
        .bruteTheme(selectedTheme.theme)
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
        ContentView()
    }
}
