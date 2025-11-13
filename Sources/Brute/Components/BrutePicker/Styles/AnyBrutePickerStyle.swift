//
//  AnyBrutePickerStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/13/25.
//

import SwiftUI

extension EnvironmentValues {
    @Entry
    var brutePickerStyle: AnyBrutePickerStyle = AnyBrutePickerStyle(.segmented)
}

extension View {
    public func brutePickerStyle(_ style: some BrutePickerStyle) -> some View {
        self.environment(\.brutePickerStyle, AnyBrutePickerStyle(style))
    }
}

struct AnyBrutePickerStyle {
    typealias Configuration = BrutePickerStyleConfiguration
    typealias ChildConfiguration = BrutePickerStyleChildConfiguration

    private var _makeBody: @MainActor (Configuration) -> AnyView
    private var _makeChild: @MainActor (ChildConfiguration) -> AnyView

    init(_ style: some BrutePickerStyle) {
        _makeBody = { AnyView(style.makeBody(config: $0)) }
        _makeChild = { AnyView(style.makeChild(config: $0)) }
    }

    @MainActor
    func makeBody(config: Configuration) -> AnyView {
        _makeBody(config)
    }

    @MainActor
    func makeChild(config: ChildConfiguration) -> AnyView {
        _makeChild(config)
    }
}
