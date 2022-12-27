//
//  ContentView.swift
//  ForecastWatherApp
//
//  Created by Алексей Однолько on 06.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isCanceledRequestForecast: Bool = false
    @StateObject private var contentViewViewModel = ContentViewViewModel()
    @StateObject private var locationManager = LocationManager()
    private let networkService = NetworkService()
    
    var body: some View {
        VStack {
            if let coordinate = locationManager.location {
                if let currantWather = contentViewViewModel.currantWather, let everyThreeHourForecast = contentViewViewModel.everyThreeHourForecast {
                    contentViewViewModel.currantWeatherView(currantWather: currantWather, everyThreeHourForecast: everyThreeHourForecast, isShowProgeressRing: $contentViewViewModel.isShowCurrantWather)
                } else if isCanceledRequestForecast == false {
                    ProgressCiecular()
                        .task {
                            contentViewViewModel.getWeatherFormNetwork(networkService: networkService, coordinate: coordinate)
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
        .alert("Error request weather.", isPresented: $contentViewViewModel.isReceiveWather, actions: {
            Button("Cancel", role: .cancel, action: { isCanceledRequestForecast = true })
            Button("Try again") {
                if let coordinate = locationManager.location {
                    contentViewViewModel.getWeatherFormNetwork(networkService: networkService, coordinate: coordinate)
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
