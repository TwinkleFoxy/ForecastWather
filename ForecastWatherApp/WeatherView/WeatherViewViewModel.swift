//
//  WeatherViewViewModel.swift
//  ForecastWatherApp
//
//  Created by Алексей Однолько on 10.09.2022.
//

import Foundation

protocol WeatherViewViewModelProtocol {
    var city: String { get }
    var date: String { get }
    var watherIcon: String { get }
    var watherDescription: String { get }
    var currantTemperature: String { get }
    
    init(dalyForecast: CurrentWeatherForecastModel)
}

class WeatherViewViewModel: WeatherViewViewModelProtocol, ObservableObject {
    var city: String {
        dalyForecast.name
    }
    
    var date: String {
        Date(timeIntervalSince1970: dalyForecast.sys.sunset).formatted(.dateTime.day().month().hour().minute())
    }
    
    var watherIcon: String {
        dalyForecast.weather[0].icon
    }
    
    var watherDescription: String {
        dalyForecast.weather[0].description
    }
    
    var currantTemperature: String {
        "\(dalyForecast.main.temp.toStringCutTail()) º"
    }
    
    
    let dalyForecast: CurrentWeatherForecastModel
    
    required init(dalyForecast: CurrentWeatherForecastModel) {
        self.dalyForecast = dalyForecast
    }
}
