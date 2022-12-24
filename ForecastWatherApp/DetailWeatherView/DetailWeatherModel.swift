//
//  DetailWeatherModel.swift
//  ForecastWatherApp
//
//  Created by Алексей Однолько on 10.09.2022.
//

import Foundation

struct DetailWeatherModel {
    var minTemp: Double
    var maxTemp: Double
    var speed: Double
    var pressure: Int
    var sunrise: Double
    var sunset: Double
    var humidity: Int
    var clouds: Int
    var everyThreeHourForecast: Days5Every3HourForecastModel
    
    init(dalyForecast: CurrentWeatherForecastModel, everyThreeHourForecast: Days5Every3HourForecastModel) {
        minTemp = dalyForecast.main.temp_min
        maxTemp = dalyForecast.main.temp_max
        speed = dalyForecast.wind.speed
        pressure = dalyForecast.main.pressure
        sunrise = dalyForecast.sys.sunrise
        sunset = dalyForecast.sys.sunset
        humidity = dalyForecast.main.humidity
        clouds = dalyForecast.clouds.all
        self.everyThreeHourForecast = everyThreeHourForecast
    }
    
    static func fackData() -> DetailWeatherModel {
        
        let dalyForecast = CurrentWeatherForecastModel.fackeData()
        let everyThreeHourForecast = Days5Every3HourForecastModel.fackData()
        
        return DetailWeatherModel(dalyForecast: dalyForecast, everyThreeHourForecast: everyThreeHourForecast)
    }
    
}
