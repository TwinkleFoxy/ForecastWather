//
//  ElementWeatherView.swift
//  ForecastWatherApp
//
//  Created by Алексей Однолько on 06.09.2022.
//

import SwiftUI

struct ElementWeatherView: View {
    let icon: String
    let title: String
    let data: String
    let backgroundColor: Color = Color.forecastCardBackground2
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.title2)
                .frame(width: 20, height: 20)
                .padding()
                .background(Color(hue: 1, saturation: 0, brightness: 0.75))
                .cornerRadius(60)
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.caption)
                    .foregroundColor(Color.white)
                Text(data)
                    .bold()
                    .font(.title)
                    .foregroundColor(Color.white)
            }
            .padding(.top, 4)
            .padding(.leading, 15)
            .padding(.trailing, 15)
            .padding(.bottom, 4)
            .background(backgroundColor)
            .cornerRadius(20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ElementWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ElementWeatherView(icon: "thermometer", title: "Temperature", data: "32")
    }
}
