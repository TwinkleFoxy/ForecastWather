//
//  ElementWeatherViewWithProgress.swift
//  ForecastWatherApp
//
//  Created by Алексей Однолько on 23.09.2022.
//

import SwiftUI

struct ElementWeatherViewWithProgress: View {
    var title: String = "Humidity"
    var data: CGFloat = 70
    let backgroundColor: Color = Color.forecastCardBackground2
    @Binding var isShow: Bool
    
    var body: some View {
        HStack {
            RingProgress(width: 50, percent: data, isShow: $isShow) // Change It!!!
                .padding(.top)
                .padding(.trailing, 5)
                .padding(.bottom)
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.caption)
                    .foregroundColor(Color.white)
                Text("\(Int(data))")
                    .font(.title)
                    .foregroundColor(Color.white)
            }
            .padding(.top, 4)
            .padding(.leading, 15)
            .padding(.trailing, 15)
            .padding(.bottom, 4)
            .background(backgroundColor)
            .cornerRadius(20)
            //.shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ElementWeatherViewWithProgress_Previews: PreviewProvider {
    static var previews: some View {
        ElementWeatherViewWithProgress(isShow: .constant(true))
    }
}
