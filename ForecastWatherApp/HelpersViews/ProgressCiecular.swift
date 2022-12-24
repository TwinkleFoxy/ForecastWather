//
//  ProgressView.swift
//  ForecastWatherApp
//
//  Created by Алексей Однолько on 08.09.2022.
//

import SwiftUI

struct ProgressCiecular: View {
    var body: some View {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCiecular()
            .preferredColorScheme(.dark)
        
    }
}
