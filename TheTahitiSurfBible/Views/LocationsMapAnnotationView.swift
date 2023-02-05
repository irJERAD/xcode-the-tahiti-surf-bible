//
//  LocationsMapAnnotationView.swift
//  TheTahitiSurfBible
//
//  Created by Jerad Acosta on 1/9/23.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    let accentColor = Color("AccentColor")
    
    var body: some View {
        VStack(spacing: 0) {
            Image("surfer_icon_filled")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
//            Image(systemName: "figure.surfing")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 30, height: 30)
//                .font(.headline)
//                .foregroundColor(.pink)
//                .padding(6)
//                .background(accentColor)
//                .cornerRadius(36)
//
//            Image(systemName: "triangle.tophalf.filled")
//                .resizable()
//                .scaledToFit()
//                .foregroundColor(.white)
//                .frame(width: 20, height: 20)
//                .rotationEffect(Angle(degrees: 180))
//                .offset(y: -3_)
//                .padding(.bottom, 40)
        }
    }
}

struct LocationMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapAnnotationView()
    }
}
