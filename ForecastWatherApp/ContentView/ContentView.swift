//
//  ContentView.swift
//  ForecastWatherApp
//
//  Created by Алексей Однолько on 06.09.2022.
//

import SwiftUI

struct ContentView: View {
    private let networkService = NetworkService()
    private let contentViewViewModel = ContentViewViewModel()
    @StateObject private var locationManager = LocationManager()
    @State private var networkError: String = ""
    @State private var isReceiveWather: Bool = false
    @State private var isShowCurrantWather: Bool = false
    @State private var isCanceledRequestForecast: Bool = false
    @State private var currantWather: CurrentWeatherForecastModel?
    @State private var everyThreeHourForecast: Days5Every3HourForecastModel?
    
    var body: some View {
        VStack {
            if let coordinate = locationManager.location {
                if let currantWather = currantWather, let everyThreeHourForecast = everyThreeHourForecast {
                    contentViewViewModel.currantWeatherView(currantWather: currantWather, everyThreeHourForecast: everyThreeHourForecast, isShowProgeressRing: $isShowCurrantWather)
                } else if isCanceledRequestForecast == false {
                    ProgressCiecular()
                        .task {
//                            print("latitude: \(coordinate.latitude)")
//                            print()
                            networkService.featchCurrentWeather(lat: coordinate.latitude, lon: coordinate.longitude) { currantWather, error in
                                if let currantWather = currantWather {
                                    self.currantWather = currantWather
                                    isShowCurrantWather = true
                                } else if let error = error {
                                    networkError = error
                                    isShowCurrantWather = false
                                    isReceiveWather ? nil : isReceiveWather.toggle()
                                }
                            }
                            
                            networkService.featchEvery3HourForecast(lat: coordinate.latitude, lon: coordinate.longitude) { everyThreeHourForecast, error in
                                if let everyThreeHourForecast = everyThreeHourForecast {
                                    self.everyThreeHourForecast = everyThreeHourForecast
                                    print(currantWather?.coord)
                                } else if let error = error {
                                    networkError = error
                                    isReceiveWather ? nil : isReceiveWather.toggle()
                                }
                            }
                        }
                } else {
                    ErrorScreenView()
                }
            } else {
                if locationManager.isLoadingLocation {
                    ProgressCiecular()
                } else {
                    GetLocationView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.666, saturation: 0.777, brightness: 0.333))
        .preferredColorScheme(.dark)
        .alert("Error recive location.", isPresented: $locationManager.isErrorReceiveLocation) {
        } message: {
            Text("\(locationManager.textErrorReceiveLocation)")
        }
        .alert("Error request weather.", isPresented: $isReceiveWather, actions: {
            Button("Cancel", role: .cancel, action: { isCanceledRequestForecast = true })
            Button("Try again") {
                if let coordinate = locationManager.location {
                    networkService.featchCurrentWeather(lat: coordinate.latitude, lon: coordinate.longitude) { currantWather, error in
                        if let currantWather = currantWather {
                            self.currantWather = currantWather
                            isShowCurrantWather = true
                        } else if let error = error {
                            networkError = error
                            isShowCurrantWather = false
                            isReceiveWather ? nil : isReceiveWather.toggle()
                        }
                    }
                    
                    networkService.featchEvery3HourForecast(lat: coordinate.latitude, lon: coordinate.longitude) { everyThreeHourForecast, error in
                        if let everyThreeHourForecast = everyThreeHourForecast {
                            self.everyThreeHourForecast = everyThreeHourForecast
                        } else if let error = error {
                            networkError = error
                            isReceiveWather ? nil : isReceiveWather.toggle()
                        }
                    }
                }
            }
        }, message: {
            Text("Request weather forecast again?")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
