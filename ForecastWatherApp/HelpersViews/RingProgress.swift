//
//  RingProgress.swift
//  ForecastWatherApp
//
//  Created by Алексей Однолько on 23.09.2022.
//

import SwiftUI

struct RingProgress: View {
    var startColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    var endColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
    var width: CGFloat = 44
    var percent: CGFloat = 80
    @Binding var isShow: Bool
    
    var body: some View {
        let multiplier = width / 44
        let endPercent = 1 - (percent / 100)
        let height: CGFloat = width
        
        ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1),
                        style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity)
                )
            
            Circle()
                .trim(from: isShow ? endPercent : 1, to: 1)
                .stroke(LinearGradient(gradient:
                    Gradient(colors: [Color(startColor), Color(endColor)]),
                    startPoint: .topLeading, endPoint: .bottomTrailing),
                    style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity)
                )
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .shadow(color: Color(endColor).opacity(0.1), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
                .animation(.easeInOut, value: isShow)
            Text("\(Int(percent))%")
                .fontWeight(.bold)
                .font(.system(size: 14 * multiplier))
        }
        .frame(width: width, height: height)
    }
}

struct RingProgress_Previews: PreviewProvider {
    static var previews: some View {
        RingProgress(isShow: .constant(true))
    }
}
