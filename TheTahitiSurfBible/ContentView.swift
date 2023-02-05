//
//  ContentView.swift
//  TheTahitiSurfBible
//
//  Created by Jerad Acosta on 1/9/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some View {
        LocationsView()
            .environmentObject(vm)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
