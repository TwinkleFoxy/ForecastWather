//
//  ForecastCardModel.swift
//  ForecastWatherApp
//
//  Created by Алексей Однолько on 10.09.2022.
//

import Foundation

struct ForecastCardModel {
    let epochDateTime: Int
    let weatherIcon: String
    let precipitationProbability: Double
    let temperature: Double
    
    init(everyThreeHoursForecast: Days5Every3HourForecastModel.list) {
        epochDateTime = everyThreeHoursForecast.dt
        weatherIcon = everyThreeHoursForecast.weather[0].icon
        precipitationProbability = everyThreeHoursForecast.pop
        temperature = everyThreeHoursForecast.main.temp
    }
    
    static func fakeData() -> ForecastCardModel {
        let main = Days5Every3HourForecastModel.list.main(temp: 12, feels_like: 12, temp_min: 8, temp_max: 23, pressure: 31, sea_level: 321, grnd_level: 312, humidity: 13)
        var weather: [Days5Every3HourForecastModel.list.weather] = []
        weather.append(Days5Every3HourForecastModel.list.weather(id: 2, main: "Clouds", description: "few clouds", icon: "02d"))
        let clouds = Days5Every3HourForecastModel.list.clouds(all: 21)
        let wind = Days5Every3HourForecastModel.list.wind(speed: 12, deg: 3, gust: 11)
        let sys = Days5Every3HourForecastModel.list.sys(pod: "d")
        
        var list: [Days5Every3HourForecastModel.list] = []
        list.append(Days5Every3HourForecastModel.list(dt: 1662476400, main: main, weather: weather, clouds: clouds, wind: wind, visibility: 312, pop: 12, sys: sys, dt_txt: "2022-09-06 15:00:00"))
        
        return ForecastCardModel(everyThreeHoursForecast: list[0])
    }
    
}
