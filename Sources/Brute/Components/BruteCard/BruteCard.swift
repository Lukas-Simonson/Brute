//
//  BruteCard.swift
//  Brute
//
//  Created by Lukas Simonson on 11/12/25.
//

import SwiftUI

public struct BruteCard<Content: View>: View {

    @Environment(\.bruteContext) private var context

    @ViewBuilder
    public let content: () -> Content

    public var body: some View {
        VStack(alignment: .leading, spacing: context.dimen.paddingMedium) {
            content()
                .bruteThemeLeveled(by: 1)
        }
        .padding(context.dimen.paddingMedium)
        .background(context.color.background)
        .brutalized()
    }
}

#Preview {

    @Previewable @State var email = ""
    @Previewable @State var password = ""

    BruteStyle {
        BruteCard {
            Text("Login to your account")
                .font(.title)
            Text("Enter your email below to login to your account")
                .font(.subheadline)

            Spacer().frame(maxHeight: 16)

            TextField("Email", text: $email)
            TextField("Password", text: $password)

            Spacer().frame(maxHeight: 16)

            Button(action: { /* do nothing */ }, label: { Text("Login").frame(maxWidth: .infinity) })
            Button(action: { /* do nothing */ }, label: { Text("Google").frame(maxWidth: .infinity) })
                .buttonStyle(.bruteNeutral)
        }
        .textFieldStyle(.brute)
        .padding()
    }
}
