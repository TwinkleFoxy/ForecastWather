//
//  ForecastViewViewModel.swift
//  ForecastWatherApp
//
//  Created by Алексей Однолько on 10.09.2022.
//

import Foundation

protocol ForecastCardViewViewModelProtocol {

    var epochDateTime: Date { get }
    var weatherIcon: String { get }
    var precipitationProbability: Int { get }
    var temperature: Int { get }
    
    init(forecastCardModel: ForecastCardModel)
}

class ForecastCardViewViewModel: ForecastCardViewViewModelProtocol, ObservableObject {

    var epochDateTime: Date {
        Date(timeIntervalSince1970: Foundation.TimeInterval(forecastCardModel.epochDateTime))
    }
    
    var weatherIcon: String {
        "\(forecastCardModel.weatherIcon)"
    }
    
    var precipitationProbability: Int {
        Int(forecastCardModel.precipitationProbability)
    }
    
    var temperature: Int {
        Int(forecastCardModel.temperature)
    }
    
    private let forecastCardModel: ForecastCardModel
    
    required init(forecastCardModel: ForecastCardModel) {
        self.forecastCardModel = forecastCardModel
    }
}
