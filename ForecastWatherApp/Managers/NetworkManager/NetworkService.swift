//
//  NetworkService.swift
//  ForecastWatherApp
//
//  Created by Алексей Однолько on 07.09.2022.
//

import Foundation

class NetworkService {
    private let networkManager = NetworkManager.shared
    
    let apiKey = "78f7691f1ed696687d4fc1a29afe07a9"
    
    func featchCurrentWeather(lat: Double = 44.34, lon: Double = 10.99, clousere: @escaping (CurrentWeatherForecastModel?, String?)->()) {
        let currentWeatherUrl = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=metric"
        networkManager.featchForecast(urlString: currentWeatherUrl, clousere: clousere)
    }
    
    func featchEvery3HourForecast(lat: Double = 44.34, lon: Double, clousere: @escaping (Days5Every3HourForecastModel?, String?)->()) {
        let currentWeatherUrl = "https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=metric"
        networkManager.featchForecast(urlString: currentWeatherUrl, clousere: clousere)
    }
    
}
