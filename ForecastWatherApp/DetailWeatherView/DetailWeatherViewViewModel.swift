//
//  DetailWeatherViewViewModel.swift
//  ForecastWatherApp
//
//  Created by Алексей Однолько on 10.09.2022.
//

import Foundation

protocol DetailWeatherViewViewModelProtocol {
    var minTemp: String { get }
    var maxTemp: String { get }
    var windSpeed: String { get }
    var pressure: String { get }
    var sunrise: String { get }
    var sunset: String { get }
    var humidity: Int { get }
    var clouds: Float { get }
    var everyThreeHourForecast: [Days5Every3HourForecastModel.list] { get }
    
    init(detailWeatherModel: DetailWeatherModel)
}

class DetailWeatherViewViewModel: DetailWeatherViewViewModelProtocol, ObservableObject {
    
    var minTemp: String {
        "\(Int(detailWeatherModel.minTemp))"
    }
    
    var maxTemp: String {
        "\(Int(detailWeatherModel.maxTemp))"
    }
    
    var windSpeed: String {
        "\(Int(detailWeatherModel.speed))"
    }
    
    var pressure: String {
        "\(detailWeatherModel.pressure)"
    }
    
    var sunrise: String {
        "\(Date(timeIntervalSince1970:  detailWeatherModel.sunrise).formatted(.dateTime.hour().minute()))"
    }
    
    var sunset: String {
        "\(Date(timeIntervalSince1970: detailWeatherModel.sunset).formatted(.dateTime.hour().minute()))"
    }
    
    var everyThreeHourForecast: [Days5Every3HourForecastModel.list] {
        detailWeatherModel.everyThreeHourForecast.list
    }
    
    var humidity: Int {
        detailWeatherModel.humidity
    }
    
    var clouds: Float {
        Float(detailWeatherModel.clouds)
    }
    
    let detailWeatherModel: DetailWeatherModel
    
    required init(detailWeatherModel: DetailWeatherModel) {
        self.detailWeatherModel = detailWeatherModel
    }
    
    
}
