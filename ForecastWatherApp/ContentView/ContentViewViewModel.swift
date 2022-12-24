//
//  ContentViewViewModel.swift
//  ForecastWatherApp
//
//  Created by Алексей Однолько on 11.09.2022.
//

import Foundation
import CoreLocation
import SwiftUI

protocol ContentViewViewModelProtocol {
    func currantWeatherView(currantWather: CurrentWeatherForecastModel, everyThreeHourForecast: Days5Every3HourForecastModel, isShowProgeressRing: Binding<Bool>) -> WeatherView?
}

class ContentViewViewModel: ContentViewViewModelProtocol {
    //    var networkService = NetworkService()
    //    var locationManager: LocationManager
    //    @State var currantWather: CurrentWeatherForecastModel?
    //    @State var everyThreeHourForecast: Days5Every3HourForecastModel?
    //    @State var isLoadedLocation = false
    
    func currantWeatherView(currantWather: CurrentWeatherForecastModel, everyThreeHourForecast: Days5Every3HourForecastModel, isShowProgeressRing: Binding<Bool>) -> WeatherView? {
        return WeatherView(isShowProgeressRing: isShowProgeressRing, viewModel: WeatherViewViewModel(dalyForecast: currantWather),
                           detailViewModel: DetailWeatherViewViewModel(detailWeatherModel: DetailWeatherModel(dalyForecast: currantWather, everyThreeHourForecast: everyThreeHourForecast)))
    }
    
    //    func featchWeather() { //coordinate: CLLocationCoordinate2D
    //        if let lat = locationManager.location?.latitude, let lon = locationManager.location?.latitude {
    //            networkService.featchCurrentWeather(lat: lat, lon: lon) { currantWather in
    //                self.currantWather = currantWather
    //            }
    //            networkService.featchEvery3HourForecast(lat: lat, lon: lon) { everyThreeHourForecast in
    //                self.everyThreeHourForecast = everyThreeHourForecast
    //            }
    //            isLoadedLocation = true
    //        }
    //
    //    }
    
    
    
    
    //
    //
    //    func presentView() -> some View {
    //        if let coordinate = locationManager.location {
    //            if let currantWather = currantWather, let everyThreeHourForecast = everyThreeHourForecast {
    //                return WeatherView(viewModel: WeatherViewViewModel(dalyForecast: currantWather),
    //                            detailViewModel: DetailWeatherViewViewModel(detailWeatherModel: DetailWeatherModel(dalyForecast: currantWather, everyThreeHourForecast: everyThreeHourForecast)))
    //            }else {
    //                return ProgressCiecular()
    //                    .task {
    //                        self.networkService.featchCurrentWeather(lat: coordinate.latitude, lon: coordinate.longitude) { currantWather in
    //                            self.currantWather = currantWather
    //                            print(currantWather?.coord)
    //                        }
    //                        self.networkService.featchEvery3HourForecast(lat: coordinate.longitude, lon: coordinate.latitude) { everyThreeHourForecast in
    //                            self.everyThreeHourForecast = everyThreeHourForecast
    //                        }
    //                    }
    //            }
    //        } else {
    //            if locationManager.isLoadingLocation {
    //                return ProgressCiecular()
    //            } else {
    //                return GetLocationView()
    //                    .environmentObject(locationManager)
    //            }
    //        }
    //    }
}
