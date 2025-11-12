//
//  Color+8Bit.swift
//  Brute
//
//  Created by Lukas Simonson on 11/11/25.
//

import SwiftUI

extension Color {
    init(r: Int, g: Int, b: Int) {
        assert([r, g, b].allSatisfy { (0...255).contains($0) }, "Provided values must range between 0 and 255")
        self = Color(red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255)
    }
}
