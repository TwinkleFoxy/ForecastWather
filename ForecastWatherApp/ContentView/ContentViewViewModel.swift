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
    func getWeatherFormNetwork(networkService: NetworkService, coordinate: CLLocationCoordinate2D)
}

class ContentViewViewModel: ContentViewViewModelProtocol, ObservableObject {
    
    @Published var networkError: String = ""
    @Published var isReceiveWather: Bool = false
    @Published var isShowCurrantWather: Bool = false
    @Published var currantWather: CurrentWeatherForecastModel?
    @Published var everyThreeHourForecast: Days5Every3HourForecastModel?
    
    func currantWeatherView(currantWather: CurrentWeatherForecastModel, everyThreeHourForecast: Days5Every3HourForecastModel, isShowProgeressRing: Binding<Bool>) -> WeatherView? {
        return WeatherView(isShowProgeressRing: isShowProgeressRing, viewModel: WeatherViewViewModel(dalyForecast: currantWather),
                           detailViewModel: DetailWeatherViewViewModel(detailWeatherModel: DetailWeatherModel(dalyForecast: currantWather, everyThreeHourForecast: everyThreeHourForecast)))
    }
    
    func getWeatherFormNetwork(networkService: NetworkService, coordinate: CLLocationCoordinate2D) {
        featchCurrentWeather(networkService: networkService, coordinate: coordinate)
        featchEvery3HourForecast(networkService: networkService, coordinate: coordinate)
    }
}

extension ContentViewViewModel {
    
    private func featchCurrentWeather(networkService: NetworkService, coordinate: CLLocationCoordinate2D) {
        networkService.featchCurrentWeather(lat: coordinate.latitude, lon: coordinate.longitude) { [unowned self] currantWather, error in
            if let currantWather = currantWather {
                DispatchQueue.main.async { [unowned self] in
                    self.currantWather = currantWather
                    isShowCurrantWather = true
                }
            } else if let error = error {
                DispatchQueue.main.async { [unowned self] in
                    networkError = error
                    isShowCurrantWather = false
                    isReceiveWather ? nil : isReceiveWather.toggle()
                }
            }
        }
    }
    
    private func featchEvery3HourForecast(networkService: NetworkService, coordinate: CLLocationCoordinate2D) {
        networkService.featchEvery3HourForecast(lat: coordinate.latitude, lon: coordinate.longitude) { [unowned self] everyThreeHourForecast, error in
            if let everyThreeHourForecast = everyThreeHourForecast {
                DispatchQueue.main.async {
                    self.everyThreeHourForecast = everyThreeHourForecast
                }
            } else if let error = error {
                DispatchQueue.main.async { [unowned self] in
                    networkError = error
                    isReceiveWather ? nil : isReceiveWather.toggle()
                }
            }
        }
    }
}
