//
//  LocationManager.swift
//  ForecastWatherApp
//
//  Created by Алексей Однолько on 08.09.2022.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoadingLocation: Bool = false
    @Published var isErrorReceiveLocation: Bool = false
    @Published var textErrorReceiveLocation: String = ""
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        isLoadingLocation = true
        manager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoadingLocation = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        isLoadingLocation = false
        textErrorReceiveLocation = "Error recive location: \(error)"
        isErrorReceiveLocation.toggle()
        print("Error recive location: \(error)")
    }
    
}
