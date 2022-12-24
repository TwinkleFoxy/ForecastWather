//
//  ErrorScreenView.swift
//  ForecastWatherApp
//
//  Created by Алексей Однолько on 07.10.2022.
//

import SwiftUI

struct ErrorScreenView: View {
    var body: some View {
        VStack {
            Text("Can't receive forecast.")
                .padding(.bottom, 5)
            Text("It may by because bad internet connection or forecast wather server Error. Try check internet connection and restart app.")
        }
        .foregroundColor(.secondary)
        .padding(5)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ErrorScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorScreenView()
            .preferredColorScheme(.dark)
    }
}
