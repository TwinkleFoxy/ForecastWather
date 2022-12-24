//
//  GetLocationView.swift
//  ForecastWatherApp
//
//  Created by Алексей Однолько on 08.09.2022.
//

import SwiftUI
import CoreLocationUI

struct GetLocationView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack() {
            VStack {
                Text("Welcom to the Wather App")
                    .bold().font(.title)
                Text("For check weather please give permission for location servicefore this App.")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.currentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(20)
            .foregroundColor(.white)
            .symbolVariant(.fill)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct GetLocationView_Previews: PreviewProvider {
    static var previews: some View {
        GetLocationView()
            .preferredColorScheme(.dark)
    }
}
