//
//  WeatherView.swift
//  ForecastWatherApp
//
//  Created by Алексей Однолько on 06.09.2022.
//

import SwiftUI

struct WeatherView: View {
    @State var section = 0
    @Binding var isShowProgeressRing: Bool
    var viewModel: WeatherViewViewModel
    var detailViewModel: DetailWeatherViewViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 8) {
                Text(viewModel.city)
                    .bold()
                    .font(.title)
                Text(viewModel.date)
                    .fontWeight(.light)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            HStack {
                VStack(spacing: 15) {
                    Image(viewModel.watherIcon)
                        .font(.system(size: 40))
                    Text(viewModel.watherDescription)
                }
                
                Spacer()
                Text(viewModel.currantTemperature)
                    .font(.system(size: 100))
                    .bold()
            }
            .padding()
            Spacer()
            
            DetailWeatherView(section: $section, isShowProgressRing: $isShowProgeressRing, viewModel: detailViewModel)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .background(Color.bottomSheetBackground)
                .foregroundColor(.white)
                .cornerRadius(25)
                .overlay {
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(lineWidth: 2)
                        .opacity(0.2)
                        .blendMode(.overlay)
                }
                //.innerShadow(shape: RoundedRectangle(cornerRadius: 25), color: .white)
                .innerShadow(shape: RoundedRectangle(cornerRadius: 25), color: .white, lineWidth: 1, blur: 6)
                .padding(1)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .edgesIgnoringSafeArea(.bottom)
        .background(BackgroundAppView())
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(isShowProgeressRing: .constant(true), viewModel: WeatherViewViewModel(dalyForecast: CurrentWeatherForecastModel.fackeData()), detailViewModel: DetailWeatherViewViewModel(detailWeatherModel: DetailWeatherModel.fackData()))
    }
}
