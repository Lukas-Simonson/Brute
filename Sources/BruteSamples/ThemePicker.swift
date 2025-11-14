//
//  ThemePicker.swift
//  Brute
//
//  Created by Lukas Simonson on 11/12/25.
//

import Brute
import SwiftUI

struct ThemePicker<Content: View>: View {

    private let themes = [
        ("Violet", BruteTheme.violet),
        ("Blue", BruteTheme.blue),
        ("Orange", BruteTheme.orange),
        ("Green", BruteTheme.green),
    ]

    @Binding var isExpanded: Bool
    @State private var theme: BruteTheme = .violet
    @Environment(\.colorScheme) var colorScheme

    let content: () -> Content

    var body: some View {
        BruteStyle {
            ScrollView {
                VStack {
                    DisclosureGroup(
                        isExpanded: $isExpanded,
                        content: {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 20)], spacing: 20) {
                                ForEach(themes, id: \.0) { (name, theme) in
                                    Button(
                                        action: {
                                            withAnimation {
                                                self.theme = theme
                                            }
                                        },
                                        label: {
                                            Text(name)
                                                .frame(maxWidth: .infinity)
                                        }
                                    )
                                    .buttonStyle(.brute)
                                    .bruteTheme(theme)
                                }
                            }
                        },
                        label: {
                            Label("Theme", systemImage: "pencil.and.outline")
                                .labelStyle(.titleAndIcon)
                        }
                    )
                    
                    content()
                }
                .padding()
            }
        }
        .bruteTheme(theme)
    }
}
