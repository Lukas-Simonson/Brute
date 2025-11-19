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

    @State private var currentGroup: ContentGroup?

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
                        disclosure(
                            for: .components,
                            title: "Components",
                            systemImage: "square.stack.3d.up",
                            content: { ComponentsDemo() }
                        )

                        disclosure(
                            for: .buttons,
                            title: "Buttons",
                            systemImage: "hand.tap",
                            content: { ButtonStylesDemo() }
                        )

                        disclosure(
                            for: .toggles,
                            title: "Toggles",
                            systemImage: "switch.2",
                            content: { ToggleStylesDemo() }
                        )

                        disclosure(
                            for: .formControls,
                            title: "Form Controls",
                            systemImage: "pencil",
                            content: { FormControlsDemo() }
                        )

                        disclosure(
                            for: .progressAndLabels,
                            title: "Progress & Labels",
                            systemImage: "chart.bar",
                            content: { ProgressAndLabelsDemo() }
                        )

                        disclosure(
                            for: .themes,
                            title: "Themes",
                            systemImage: "paintpalette",
                            content: { ThemesDemo() }
                        )
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

    func disclosure(for group: ContentGroup, title: LocalizedStringKey, systemImage: String, content: @escaping () -> some View) -> some View {
        DisclosureGroup(
            isExpanded: Binding(
                get: { currentGroup == group },
                set: { currentGroup = $0 ? group : nil }
            ),
            content: content,
            label: { Label(title, systemImage: systemImage) }
        )
    }
}

extension ContentView {
    enum ContentGroup {
        case components
        case buttons
        case toggles
        case formControls
        case progressAndLabels
        case themes
    }
}

enum ThemeOption: String, CaseIterable, Hashable {
    case violet
    case blue
    case orange
    case green
    case magenta
    case maroon
    case multi

    var theme: BruteTheme {
        switch self {
            case .violet: BruteTheme.violet
            case .blue: BruteTheme.blue
            case .orange: BruteTheme.orange
            case .green: BruteTheme.green
            case .magenta: BruteTheme.magenta
            case .maroon: BruteTheme.maroon
            case .multi: BruteTheme.multi
        }
    }
}

#Preview {
    @Previewable @State var theme = ThemeOption.violet

    BruteStyle {
        ContentView(selectedTheme: $theme)
    }
    .bruteTheme(theme.theme)
    .animation(.default, value: theme)
}
