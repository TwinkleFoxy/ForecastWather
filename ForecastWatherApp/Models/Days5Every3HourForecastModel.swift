//
//  Days5Every3HourForecastModel.swift
//  ForecastWatherApp
//
//  Created by Алексей Однолько on 06.09.2022.
//

import Foundation

struct Days5Every3HourForecastModel: Codable {
    
    struct list: Codable {
        struct main: Codable {
            let temp: Double
            let feels_like: Double
            let temp_min: Double
            let temp_max: Double
            let pressure: Int
            let sea_level: Int
            let grnd_level: Int
            let humidity: Int
        }
        struct weather: Codable {
            let id: Int
            let main: String
            let description: String
            let icon: String
        }
        struct clouds: Codable {
            let all: Int
        }
        struct wind: Codable {
            let speed: Double
            let deg: Int
            let gust: Double
        }
        struct sys: Codable {
            let pod: String
        }
        
        let dt: Int
        let main: main
        let weather: [weather]
        let clouds: clouds
        let wind: wind
        let visibility: Int
        let pop: Double
        let sys: sys
        let dt_txt: String
    }
    struct city: Codable {
        struct coord: Codable {
            let lat: Double
            let lon: Double
        }
        
        let id: Int
        let name: String
        let coord: coord
        let country: String
        let population: Int
        let timezone: Int
        let sunrise: Double
        let sunset: Double
    }
    
    let list: [list]
    let city: city
    
    static func fackData() -> Days5Every3HourForecastModel {
        let main = Days5Every3HourForecastModel.list.main(temp: 12, feels_like: 12, temp_min: 8, temp_max: 23, pressure: 31, sea_level: 321, grnd_level: 312, humidity: 13)
        var weather: [Days5Every3HourForecastModel.list.weather] = []
        weather.append(Days5Every3HourForecastModel.list.weather(id: 2, main: "Clouds", description: "few clouds", icon: "02d"))
        let clouds = Days5Every3HourForecastModel.list.clouds(all: 21)
        let wind = Days5Every3HourForecastModel.list.wind(speed: 12, deg: 3, gust: 11)
        let sys = Days5Every3HourForecastModel.list.sys(pod: "d")
        
        var list: [list] = []
        list.append(Days5Every3HourForecastModel.list(dt: 1662476400, main: main, weather: weather, clouds: clouds, wind: wind, visibility: 312, pop: 543, sys: sys, dt_txt: "2022-09-06 15:00:00"))
        let coord = Days5Every3HourForecastModel.city.coord(lat: 10, lon: 10)
        let city = Days5Every3HourForecastModel.city(id: 1, name: "NewYork", coord: coord, country: "USA", population: 2332, timezone: 124, sunrise: 1662439471, sunset: 1662486291)
        
        
        return Days5Every3HourForecastModel(list: list, city: city)
    }
}


struct Days5Every3HourForecastModel2: Codable {
    
    struct list: Codable {
        struct main: Codable {
            let temp: Double
            let feels_like: Double
            let temp_min: Double
            let temp_max: Double
            let pressure: Int
            let sea_level: Int
            let grnd_level: Int
            let humidity: Int
        }
        struct weather: Codable {
            let id: Int
            let main: String
            let description: String
            let icon: String
        }
        struct clouds: Codable {
            let all: Int
        }
        struct wind: Codable {
            let speed: Double
            let deg: Int
            let gust: Double
        }
        struct sys: Codable {
            let pod: String
        }
        
        let dt: Int
        let main: main
        let weather: [weather]
        let clouds: clouds
        let wind: wind
        let visibility: Int
        let pop: Double
        let sys: sys
        let dt_txt: String
    }
    struct city: Codable {
        struct coord: Codable {
            let lat: Double
            let lon: Double
        }

        let id: Int
        let name: String
        let coord: coord
        let country: String
        let population: Int
        let timezone: Int
        let sunrise: Double
        let sunset: Double
    }
    
    let list: [list]
    let city: city
    
}

//{
//   "cod":"200",
//   "message":0,
//   "cnt":40,
//   "list":[
//    {
//             "dt":1662476400,
//             "main":{
//                "temp":25.96,
//                "feels_like":25.96,
//                "temp_min":25.96,
//                "temp_max":26.17,
//                "pressure":1017,
//                "sea_level":1017,
//                "grnd_level":935,
//                "humidity":56,
//                "temp_kf":-0.21
//             },
//             "weather":[
//                {
//                   "id":801,
//                   "main":"Clouds",
//                   "description":"few clouds",
//                   "icon":"02d"
//                }
//             ],
//             "clouds":{
//                "all":24
//             },
//             "wind":{
//                "speed":0.85,
//                "deg":97,
//                "gust":2.37
//             },
//             "visibility":10000,
//             "pop":0,
//             "sys":{
//                "pod":"d"
//             },
//             "dt_txt":"2022-09-06 15:00:00"
//          },
//    ]
//    "city":{
//         "id":3163858,
//         "name":"Zocca",
//         "coord":{
//            "lat":44.34,
//            "lon":10.99
//         },
//         "country":"IT",
//         "population":4593,
//         "timezone":7200,
//         "sunrise":1662439471,
//         "sunset":1662486291
//      }
//   }
