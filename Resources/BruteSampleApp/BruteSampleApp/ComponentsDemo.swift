//
//  ComponentsDemo.swift
//  BruteSampleApp
//
//  Created by Lukas Simonson on 11/17/25.
//

import SwiftUI
import Brute

struct ComponentsDemo: View {

    @Environment(\.bruteContext) private var theme

    @State private var pickerSelection = "Option 1"
    let pickerOptions = ["Option 1", "Option 2", "Option 3"]

    var body: some View {
        VStack(alignment: .leading, spacing: theme.dimen.paddingMedium) {
            // BruteCard Examples
            VStack(alignment: .leading, spacing: theme.dimen.paddingSmall) {
                Text("BruteCard")
                    .font(theme.font.header)

                BruteCard {
                    Text("Simple Card")
                        .font(theme.font.header)
                    Text("This is a card component with the current theme")
                }

                BruteCard {
                    VStack(alignment: .leading, spacing: theme.dimen.paddingSmall) {
                        Text("Card with Content")
                            .font(.title3)
                            .fontWeight(.bold)

                        Text("Cards can contain any SwiftUI views")
                        HStack {
                            Image(systemName: "star.fill")
                            Image(systemName: "heart.fill")
                            Image(systemName: "hand.thumbsup.fill")
                        }
                    }
                }
            }

            Divider()

            // BruteNotice Examples
            VStack(alignment: .leading, spacing: theme.dimen.paddingSmall) {
                Text("BruteNotice")
                    .font(theme.font.header)

                BruteNotice("Info", systemImage: "info.circle") {
                    Text("This is an informational notice component")
                }

                BruteNotice("Important", systemImage: "exclamationmark.triangle", fill: .yellow) {
                    Text("Notices can highlight important information")
                }

                BruteNotice("Error", systemImage: "exclamationmark.circle", fill: .red) {
                    Text("And can be customized with a special fill color")
                }
            }

            Divider()

            // BrutePicker Example
            VStack(alignment: .leading, spacing: theme.dimen.paddingSmall) {
                Text("BrutePicker")
                    .font(theme.font.header)

                BrutePicker(selection: $pickerSelection) {
                    ForEach(pickerOptions, id: \.self) { option in
                        Text(option)
                    }
                }

                Text("Selected: \(pickerSelection)")
                    .font(theme.font.caption)
            }
        }
    }
}

#Preview {
    BruteStyle {
        ScrollView {
            ComponentsDemo()
        }
        .bruteTheme(.violet)
    }
}
