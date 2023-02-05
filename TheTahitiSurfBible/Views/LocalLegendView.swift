//
//  LocalLegendView.swift
//  TheTahitiSurfBible
//
//  Created by Jerad Acosta on 1/30/23.
//

import MapKit
import SwiftUI

struct LocalLegendView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    let location: SurfLocation
    
    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    HStack {
                        VStack(alignment: .leading) {
                            Text("FENUA")
                                .font(.headline)
                            Text("Teahupo'o")
                        }
                        VStack(alignment: .leading) {
                            Text("Stick Check")
                                .font(.headline)
                            Text("5ft 10in Stone Fish")
                        }
                        VStack(alignment: .leading) {
                            Text("Best Day")
                                .font(.headline)
                            Text("Peaks for days")
                        }
                    }
                    Image("kauli-vaast-ok")
                        .resizable()
                        .scaledToFit()
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
//        .overlay(backButton, alignment: .topLeading)
        .overlay(localLegendsButton, alignment: .topTrailing)
    }
}

struct LocalLegendView_Previews: PreviewProvider {
    static var previews: some View {
        LocalLegendView(location: LocationsDataService.surfLocations.first!)
            .environmentObject(LocationsViewModel())
    }
}

extension LocalLegendView {
        
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Local Legend")
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text("Kauli Vaust")
                .font(.title3)
                .foregroundColor(.secondary)
        }
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Kauli was raised surfing the --side of Tahiti. Instantly drawn to surfing from a young age with heros like Taj Burrow. When Getting wet became more important that chasing girls he decided to make the fulltime commitment and chase the dream: the tour.")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            if let url = URL(string: location.report) {
                Link("Check Out Kauli WCT Tour Page", destination: url)
                    .font(.headline)
                    .tint(.blue)
            }
        }
    }
    
    private var localLegendsButton: some View {
        Button {
            
        } label: {
            Image(systemName: "books.vertical.circle")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }
    }
    
}
