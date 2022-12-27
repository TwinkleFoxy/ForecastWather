//
//  ForecastCardView.swift
//  ForecastWatherApp
//
//  Created by Алексей Однолько on 10.09.2022.
//

import SwiftUI

struct ForecastCardView: View {
    var viewModel: ForecastCardViewViewModel
    
    var isActive: Bool {
            let isThisHour = Calendar.current.isDate(.now, equalTo: viewModel.epochDateTime, toGranularity: .hour)
            return isThisHour
    }
    
    var body: some View {
        ZStack {
            // MARK: Card
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.forecastCardBackground.opacity(isActive ? 1 : 0.2))
                .frame(width: 66, height: 159)
                .shadow(color: .black.opacity(0.25), radius: 10, x: 5, y: 4)
                .overlay {
                    // MARK: Card Border
                    RoundedRectangle(cornerRadius: 30)
                        .strokeBorder(.white.opacity(isActive ? 0.5 : 0.2))
                        .blendMode(.overlay)
                }
                .innerShadow(shape: RoundedRectangle(cornerRadius: 30), color: .white.opacity(0.25), lineWidth: 1, offsetX: 1, offsetY: 1, blur: 0, blendMode: .overlay)
            
            // MARK: Content
            VStack(spacing: 16) {
                // MARK: Forecast Date
                VStack(spacing: 5) {
                    Text(viewModel.epochDateTime, format: .dateTime.hour())
                        .font(.subheadline.weight(.semibold))
                    Text(viewModel.epochDateTime, format: .dateTime.day().month())
                        .font(.subheadline.weight(.semibold))
                }
                VStack(spacing: -4) {
                    // MARK: Forecast Small Icon
                    Image("\(viewModel.weatherIcon)")
                    
                    // MARK: Forecast Probability
                    Text(viewModel.precipitationProbability, format: .percent)
                        .font(.footnote.weight(.semibold))
                        .foregroundColor(Color.probabilityText)
                        .opacity(viewModel.precipitationProbability > 0 ? 1 : 0)
                }
                .frame(height: 42)
                
                // MARK: Forecast Temperature
                Text("\(viewModel.temperature)°")
                    .font(.title3)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 16)
            .frame(width: 70, height: 159)
        }
    }
}

struct ForecastCard_Previews: PreviewProvider {
    static var previews: some View {
        ForecastCardView(viewModel: ForecastCardViewViewModel(forecastCardModel: ForecastCardModel.fakeData()))
    }
}
