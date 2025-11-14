//
//  Sample.swift
//  Brute
//
//  Created by Lukas Simonson on 11/12/25.
//

import Brute
import SwiftUI

struct Sample: View {

    @State private var groups = Groups()

    @State private var textInput = ""
    @State private var toggled = false
    @State private var picked = 0

    var body: some View {
        ThemePicker(isExpanded: $groups.theme) {
            VStack {
                buttonsSample
                labelsSample

                gaugesSample
                progressViewSamples

                textFieldSamples
                toggleSamples
                pickerSamples
            }
        }
    }

    struct Groups {
        static let `default` = false

        var theme = Self.default

        var buttons = Self.default
        var labels = Self.default

        var gauges = Self.default
        var progressViews = Self.default

        var textFields = Self.default
        var toggles = Self.default
        var pickers = Self.default
    }
}

// MARK: Buttons
extension Sample {
    private var buttonsSample: some View {
        DisclosureGroup("Buttons", isExpanded: $groups.buttons) {
            LazyVGrid(columns: [GridItem(), GridItem()]) {
                Button(
                    action: { /* do nothing */ },
                    label: { Text("Default Button").frame(maxWidth: .infinity) }
                )

                Button(
                    action: { /* do nothing */ },
                    label: { Text("Neutral Button").frame(maxWidth: .infinity) }
                ).buttonStyle(.bruteNeutral)

                Button(
                    action: { /* do nothing */ },
                    label: { Text("Reverse Button").frame(maxWidth: .infinity) }
                ).buttonStyle(.bruteReverse)

                Button(
                    action: { /* do nothing */ },
                    label: { Text("Basic Button").frame(maxWidth: .infinity) }
                ).buttonStyle(.bruteBasic)
            }
        }
    }
}

// MARK: Labels
extension Sample {
    private var labelsSample: some View {
        DisclosureGroup("Labels", isExpanded: $groups.labels) {
            LazyVGrid(columns: .init(repeating: GridItem(alignment: .leading), count: 4)) {
                Text("Badge:")

                Label("Both", systemImage: "photo.artframe")

                Label("Title Only", systemImage: "photo.artframe")
                    .labelStyle(.bruteBadge(.titleOnly))

                Label("Icon Only", systemImage: "photo.artframe")
                    .labelStyle(.bruteBadge(.iconOnly))

                Text("Neutral Badge:")

                Label("Both", systemImage: "photo.artframe")
                    .labelStyle(.bruteBadgeNeutral)

                Label("Title Only", systemImage: "photo.artframe")
                    .labelStyle(.bruteBadgeNeutral(.titleOnly))

                Label("Icon Only", systemImage: "photo.artframe")
                    .labelStyle(.bruteBadgeNeutral(.iconOnly))
            }
        }
    }
}

// MARK: Gauges
extension Sample {
    private var gaugesSample: some View {
        DisclosureGroup("Gauges", isExpanded: $groups.gauges) {
            LazyVGrid(columns: [GridItem(alignment: .top), GridItem(alignment: .top)]) {
                Gauge(value: 0.5) {
                    Text("Basic Gauge")
                }

                Gauge(value: 15, in: 0...100) {
                    Text("Range Gauge")
                }

                Gauge(
                    value: 0.74,
                    label: { Text("Current Value") },
                    currentValueLabel: { Text("75%") }
                )

                Gauge(
                    value: 33,
                    in: 0...100,
                    label: { Text("All Labels") },
                    currentValueLabel: { Text("33") },
                    minimumValueLabel: { Text("0") },
                    maximumValueLabel: { Text("100") }
                )
            }
        }
    }
}

// MARK: Progress Views
extension Sample {
    private var progressViewSamples: some View {
        DisclosureGroup("Progress Views", isExpanded: $groups.progressViews) {
            VStack {
                ProgressView("Determinate", value: 0.25)
                ProgressView("Indeterminate")
            }
        }
    }
}

// MARK: Text Fields
extension Sample {
    private var textFieldSamples: some View {
        DisclosureGroup("Text Fields", isExpanded: $groups.textFields) {
            VStack {
                TextField("Name:", text: $textInput)
                TextField("Email:", text: $textInput)
            }
            .textFieldStyle(.brute)
        }
    }
}

// MARK: Toggles
extension Sample {
    private var toggleSamples: some View {
        DisclosureGroup("Toggles", isExpanded: $groups.toggles) {
            HStack {
                Toggle(isOn: $toggled) {
                    Text("Switch")
                }

                Spacer()

                Toggle(isOn: $toggled) {
                    Text("Checkbox")
                }.toggleStyle(.bruteCheckbox)
            }
        }
    }
}

// MARK: Pickers
extension Sample {
    private var pickerSamples: some View {
        DisclosureGroup("Pickers", isExpanded: $groups.pickers) {
            BrutePicker(selection: $picked) {
                ForEach(0..<4) { i in
                    Text("Value: \(i)")
                        .tag(i)
                }
            }
            .brutePickerStyle(.segmented)
        }
    }
}

#Preview {
    Sample()
}
