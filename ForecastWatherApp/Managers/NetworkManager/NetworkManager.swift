//
//  NetworkManager.swift
//  ForecastWatherApp
//
//  Created by Алексей Однолько on 06.09.2022.
//

import Foundation

class NetworkManager: ObservableObject {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func featchForecast<T: Codable>(urlString: String, clousere: @escaping (T?, String?)->()) {
        guard let url = URL(string: urlString) else { print("Error cheking link ForecastWather"); clousere(nil, "Error cheking link ForecastWather"); return }
        
        URLSession.shared.dataTask(with: url) { [unowned self] data, _, error in
            if let error = error {
                print("Error request weather forecast: \(error)")
                clousere(nil, "Error request weather forecast: \(error.localizedDescription)")
                //return
            }
            let decodedData = decodeData(type: T.self, data: data)
            guard let data = data else { return }
//            let lol = try? JSONSerialization.jsonObject(with: data)
//            print(urlString)
//            print(lol)
            if decodedData != nil {
                DispatchQueue.main.async {
                    clousere(decodedData, nil)
                }
            } else {
                DispatchQueue.main.async {
                    clousere(nil, "Error: can't decoded data recived from Forecast API.")
                }
            }
            
        }.resume()
    }
    
    private func decodeData<T: Codable>(type: T.Type, data: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = data else { print("Error extraction Data for decoder");
                                    return nil }
        
        do {
            let decodetData = try decoder.decode(type, from: data)
            return decodetData
        } catch let error {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }
}
