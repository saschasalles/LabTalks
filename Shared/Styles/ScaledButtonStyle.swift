//
//  ScaledButtonStyle.swift
//  LabTalks
//
//  Created by Sascha Sallès on 15/02/2021.
//

import SwiftUI

struct ScaledButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(13)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7128507653)), radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? -2: -3, y: configuration.isPressed ? -2: -6)
                        .shadow(color: .clear, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? 7: 18, y: configuration.isPressed ? 4: 8)
                        .blendMode(.overlay)
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .fill(Color(.secondarySystemFill))
                }
        )
            .scaleEffect(configuration.isPressed ? 0.95: 1)
            .foregroundColor(.primary)
            .animation(.spring())
    }
}
