//
//  BrutePackageIcon.swift
//  BruteSampleApp
//
//  Created by Lukas Simonson on 11/18/25.
//

import Brute
import SwiftUI

struct BrutePackageIcon: View {
    @Environment(\.bruteContext) private var context

    var body: some View {
//        Text("BRUTE")
//            .font(.system(size: 48, weight: .black))
//            .padding(context.dimen.paddingMedium)
//            .foregroundStyle(context.color.accentForeground)
//            .brutalized(with: context.color.accentBackground)
    }
}

#Preview {
    BruteStyle {
        BrutePackageIcon()
    }
}
