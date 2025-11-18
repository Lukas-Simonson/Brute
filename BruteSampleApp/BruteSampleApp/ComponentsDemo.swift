//
//  ComponentsDemo.swift
//  BruteSampleApp
//
//  Created by Lukas Simonson on 11/17/25.
//

import SwiftUI
import Brute

struct ComponentsDemo: View {
    @State private var pickerSelection = "Option 1"
    let pickerOptions = ["Option 1", "Option 2", "Option 3"]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // BruteCard Examples
            VStack(alignment: .leading, spacing: 12) {
                Text("BruteCard")
                    .font(.headline)

                BruteCard {
                    Text("Simple Card")
                        .font(.title3)
                    Text("This is a card component with the current theme")
                }

                BruteCard {
                    VStack(alignment: .leading, spacing: 8) {
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
            VStack(alignment: .leading, spacing: 12) {
                Text("BruteNotice")
                    .font(.headline)

                BruteNotice {
                    Label("Info", systemImage: "info.circle")
                } content: {
                    Text("This is an informational notice component")
                }

                BruteNotice {
                    Label("Important", systemImage: "exclamationmark.triangle")
                } content: {
                    Text("Notices can highlight important information")
                }
            }

            Divider()

            // BrutePicker Example
            VStack(alignment: .leading, spacing: 12) {
                Text("BrutePicker")
                    .font(.headline)

                BrutePicker(selection: $pickerSelection) {
                    ForEach(pickerOptions, id: \.self) { option in
                        Text(option)
                    }
                }

                Text("Selected: \(pickerSelection)")
                    .font(.caption)
            }
        }
        .padding()
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
