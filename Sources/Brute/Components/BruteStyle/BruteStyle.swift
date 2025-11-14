//
//  BruteStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/13/25.
//

import SwiftUI

public struct BruteStyle<Content: View>: View {

    @Environment(\.bruteContext) var context

    @ViewBuilder
    public let content: () -> Content

    public var body: some View {
        ZStack {
            context.color.background
                .ignoresSafeArea()

            BruteGridShape(density: 8)
                .stroke(context.color.foreground.opacity(0.15), lineWidth: 1)
                .ignoresSafeArea()

            content()
        }
        .buttonStyle(.brute)
        .disclosureGroupStyle(.brute)
        .gaugeStyle(.brute)
        .progressViewStyle(.brute)
        .textFieldStyle(.brute)
        .toggleStyle(.bruteSwitch)
    }
}

#Preview("BruteStyle") {
    BruteStyle {

    }
}
