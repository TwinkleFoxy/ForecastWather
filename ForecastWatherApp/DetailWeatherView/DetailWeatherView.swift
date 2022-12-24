//
//  DetailWeatherView.swift
//  ForecastWatherApp
//
//  Created by Алексей Однолько on 10.09.2022.
//

import SwiftUI

struct DetailWeatherView: View {
    @Binding var section: Int
    @Binding var isShowProgressRing: Bool
    var viewModel: DetailWeatherViewViewModel
    
    var body: some View {
            VStack(alignment: .leading, spacing: 20) {
                SegmentedControl(selection: $section)
                ScrollView(.horizontal, showsIndicators: false) {
                    if section == 0 {
                        HStack(spacing: 33) {
                            
                            VStack(spacing: 23) {
                                ElementWeatherView(icon: "thermometer", title: "Min tepm", data: viewModel.minTemp)

                                ElementWeatherView(icon: "thermometer", title: "Max temp", data: viewModel.maxTemp)
                            }
                            .frame(width: 150, height: 200)
                            VStack(spacing: 23) {
                                ElementWeatherView(icon: "wind", title: "Wind speed", data: viewModel.windSpeed)

                                ElementWeatherView(icon: "rectangle.compress.vertical", title: "Pressure", data: viewModel.pressure)
                            }
                            .frame(width: 180, height: 200)
                            VStack(spacing: 23) {
                                ElementWeatherView(icon: "sunrise", title: "Senrise", data: viewModel.sunrise)

                                ElementWeatherView(icon: "sunset", title: "Sunset", data: viewModel.sunset)
                            }
                            .frame(width: 220, height: 200)
                            VStack(spacing: 23) {
                                ElementWeatherViewWithProgress(title: "Clouds", data: CGFloat(viewModel.clouds), isShow: $isShowProgressRing)
                                
                                ElementWeatherViewWithProgress(title: "Humidity", data: CGFloat(viewModel.humidity), isShow: $isShowProgressRing)
                            }
                            .frame(width: 180, height: 200)
                        }
                    } else {
                        HStack(spacing: 23) {
                            ForEach(viewModel.everyThreeHourForecast, id: \.dt_txt) { hourlyForecast in
                                ForecastCardView(viewModel: ForecastCardViewViewModel(forecastCardModel: ForecastCardModel(everyThreeHoursForecast: hourlyForecast)))
                            }
                        }
                    }
                }
            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .padding(3)
//            .padding(.bottom, 20)
//            .background(Color(.white))
//            .foregroundColor(Color(hue: 0.666, saturation: 0.777, brightness: 0.333))
//            .cornerRadius(25)
    }
}

struct DetailWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWeatherView(section: .constant(0), isShowProgressRing: .constant(true), viewModel: DetailWeatherViewViewModel(detailWeatherModel: DetailWeatherModel.fackData()))
    }
}
