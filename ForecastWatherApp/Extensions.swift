//
//  Extensions.swift
//  ForecastWatherApp
//
//  Created by Алексей Однолько on 08.09.2022.
//

import Foundation
import SwiftUI

extension Color {
    static let bottomSheetBackground = LinearGradient(gradient: Gradient(colors: [Color("Background 1").opacity(0.26), Color("Background 2").opacity(0.26)]), startPoint: .topLeading, endPoint: .bottomTrailing)
    static let underline = LinearGradient(gradient: Gradient(colors: [.white.opacity(0), .white, .white.opacity(0)]), startPoint: .leading, endPoint: .trailing)
    static let forecastCardBackground = Color("Forecast Card Background")
    static let forecastCardBackground2 = Color("Forecast Card Background 2")
    static let probabilityText = Color("Probability Text")
}

extension Double {
    func toStringCutTail() -> String {
        return String(format: "%.0f", self)
    }
}

extension View {
    func innerShadow<S: Shape, SS: ShapeStyle>(shape: S, color: SS, lineWidth: CGFloat = 1, offsetX: CGFloat = 0, offsetY: CGFloat = 0, blur: CGFloat = 4, blendMode: BlendMode = .normal, opacity: Double = 1) -> some View {
        return self
            .overlay {
                shape
                    .stroke(color, lineWidth: lineWidth)
                    .blendMode(blendMode)
                    .offset(x: offsetX, y: offsetY)
                    .blur(radius: blur)
                    .mask(shape)
                    .opacity(opacity)
            }
    }
}
