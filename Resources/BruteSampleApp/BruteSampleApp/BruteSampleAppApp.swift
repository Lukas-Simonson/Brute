//
//  BruteSampleAppApp.swift
//  BruteSampleApp
//
//  Created by Lukas Simonson on 11/17/25.
//

import SwiftUI
import Brute

@main
struct BruteSampleAppApp: App {

    @State var selectedTheme = ThemeOption.violet

    var body: some Scene {
        WindowGroup {
            BruteStyle {
                ContentView(selectedTheme: $selectedTheme)
            }
            .bruteTheme(selectedTheme.theme)
        }
    }
}
