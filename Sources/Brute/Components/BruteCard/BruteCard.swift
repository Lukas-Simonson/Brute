//
//  BruteCard.swift
//  Brute
//
//  Created by Lukas Simonson on 11/12/25.
//

import SwiftUI

public struct BruteCard<Content: View>: View {

    @Environment(\.bruteTheme) private var theme

    @ViewBuilder
    public let content: () -> Content

    public var body: some View {
        VStack(alignment: .leading, spacing: theme.dimen.contentPadding) {
            content()
        }
        .padding(theme.dimen.contentPadding)
        .background(theme.color.background)
        .brutalized()
    }
}

#Preview {

    @Previewable @Environment(\.bruteTheme) var theme
    @Previewable @State var email = ""
    @Previewable @State var password = ""

    BruteCard {
        Text("Login to your account")
            .font(.title)
        Text("Enter your email below to login to your account")
            .font(.subheadline)

        Spacer().frame(maxHeight: theme.dimen.contentPadding)

        TextField("Email", text: $email)
        TextField("Password", text: $password)

        Spacer().frame(maxHeight: theme.dimen.contentPadding)

        Button(action: { /* do nothing */ }, label: { Text("Login").frame(maxWidth: .infinity) })
        Button(action: { /* do nothing */ }, label: { Text("Google").frame(maxWidth: .infinity) })
            .buttonStyle(.bruteNeutral)
    }
    .textFieldStyle(.brute)
    .buttonStyle(.brute)
    .padding()
}
