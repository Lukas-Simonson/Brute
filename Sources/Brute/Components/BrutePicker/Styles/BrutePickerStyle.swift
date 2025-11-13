//
//  BrutePickerStyle.swift
//  Brute
//
//  Created by Lukas Simonson on 11/12/25.
//

import SwiftUI

public protocol BrutePickerStyle: Sendable {
    typealias Configuration = BrutePickerStyleConfiguration
    typealias ChildConfiguration = BrutePickerStyleChildConfiguration

    associatedtype Body: View
    associatedtype Child: View

    @MainActor
    func makeBody(config: Configuration) -> Body

    @MainActor
    func makeChild(config: ChildConfiguration) -> Child
}

@MainActor
public struct BrutePickerStyleConfiguration {
    let environment: EnvironmentValues
    let selection: AnyHashable
    let children: Children

    struct Children: View {
        let body: AnyView
    }
}

@MainActor
public struct BrutePickerStyleChildConfiguration {
    let environment: EnvironmentValues
    let label: Label
    @Binding var isSelected: Bool

    struct Label: View {
        let body: AnyView
    }
}
