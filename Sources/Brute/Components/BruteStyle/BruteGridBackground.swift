//
//  BruteGridBackground.swift
//  Brute
//
//  Created by Lukas Simonson on 11/17/25.
//

import SwiftUI

public struct BruteGridBackground: View {

    @Environment(\.bruteContext) private var context

    public init() { }

    public var body: some View {
        BruteGridShape(density: Int(context.dimen.paddingSmall))
            .stroke(context.color.foreground.opacity(0.05), lineWidth: context.dimen.borderWidth)
            .background(context.color.background)
            .ignoresSafeArea()
    }
}
