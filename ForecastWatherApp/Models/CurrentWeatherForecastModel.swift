//
//  CurrentWeatherForecastModel.swift
//  ForecastWatherApp
//
//  Created by Алексей Однолько on 06.09.2022.
//

import Foundation

struct CurrentWeatherForecastModel: Codable {
    
    struct coord: Codable {
        let lon: Double
        let lat: Double
    }
    struct weather: Codable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }
    struct main: Codable {
        let temp: Double
        let feels_like: Double
        let temp_min: Double
        let temp_max: Double
        let pressure: Int
        let humidity: Int
    }
    struct wind: Codable {
        let speed: Double
        let deg: Int
        let gust: Double?
    }
    struct clouds: Codable {
        let all: Int
    }
    struct sys: Codable {
        let country: String
        let sunrise: Double
        let sunset: Double
    }
    
    let coord: coord
    let weather: [weather]
    let main: main
    let visibility: Int
    let wind: wind
    let clouds: clouds
    let dt: Double
    let sys: sys
    let timezone: Int
    let id: Int
    let name: String
    
    static func fackeData() -> CurrentWeatherForecastModel {
        
        let coord = CurrentWeatherForecastModel.coord(lon: 10.1, lat: 10.1)
        var weather: [weather] = []
        weather.append(CurrentWeatherForecastModel.weather(id: 1, main: "Clouds", description: "few clouds", icon: "02d"))
        let main = CurrentWeatherForecastModel.main(temp: 10, feels_like: 10, temp_min: 8, temp_max: 29, pressure: 1203, humidity: 11)
        let wind = CurrentWeatherForecastModel.wind(speed: 21, deg: 3, gust: 29)
        let clouds = CurrentWeatherForecastModel.clouds(all: 23)
        let sys = CurrentWeatherForecastModel.sys(country: "USA", sunrise: 1662439471, sunset: 1662439471)
        
        return CurrentWeatherForecastModel(coord: coord, weather: weather, main: main, visibility: 100, wind: wind, clouds: clouds, dt: 1662439471, sys: sys, timezone: 7000, id: 100, name: "NewYork")
    }
    
}

//{
//   "coord":{
//      "lon":10.99,
//      "lat":44.34
//   },
//   "weather":[
//      {
//         "id":801,
//         "main":"Clouds",
//         "description":"few clouds",
//         "icon":"02d"
//      }
//   ],
//   "base":"stations",
//   "main":{
//      "temp":298.35,
//      "feels_like":298.6,
//      "temp_min":295.8,
//      "temp_max":301.95,
//      "pressure":1019,
//      "humidity":64,
//      "sea_level":1019,
//      "grnd_level":937
//   },
//   "visibility":10000,
//   "wind":{
//      "speed":1.48,
//      "deg":53,
//      "gust":2.26
//   },
//   "clouds":{
//      "all":23
//   },
//   "dt":1662463661,
//   "sys":{
//      "type":2,
//      "id":2004688,
//      "country":"IT",
//      "sunrise":1662439471,
//      "sunset":1662486291
//   },
//   "timezone":7200,
//   "id":3163858,
//   "name":"Zocca",
//   "cod":200
//}
