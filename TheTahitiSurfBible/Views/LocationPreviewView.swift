//
//  LocationPreviewView.swift
//  TheTahitiSurfBible
//
//  Created by Jerad Acosta on 1/9/23.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    @StateObject private var saved = SavedViewModel()
    
//    @State var isDragging = false
    @State var currentPosition: CGFloat = 0
    @State var endingPosition: CGFloat = 0
    
    
    let location: SurfLocation
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16.0) {
                imageSection
                titleSection
            }
            
            VStack(spacing: 8) {
                learnMoreButton
                HStack(spacing: 16) {
                    surfedButton
                    bookmarkButton
                }
            }
        }
        .padding(20)
        .background(
        RoundedRectangle(cornerRadius: 10)
            .fill(.ultraThinMaterial)
            .offset(y: 65)
        )
        .cornerRadius(10)
        // Can only drag horizontally
        .offset(x: currentPosition)
        .offset(x: endingPosition)
        .gesture(
            DragGesture()
                .onChanged { value in
                    withAnimation(.spring()) {
                        currentPosition = value.translation.width
//                        isDragging = true
                    }
                }
                .onEnded { value in
                    withAnimation(.spring()) {
                        if currentPosition < -75 {
                            vm.previousButtonPressed()
                            currentPosition = 0
                        } else if currentPosition > 75 {
                            vm.nextButtonPressed()
                            currentPosition = 0
                        }
                        else {
                            currentPosition = 0
                        }
                    }
                }
        )
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.green.ignoresSafeArea()
            
            LocationPreviewView(
                location: LocationsDataService.surfLocations.first!)
                .padding()
        }
        .environmentObject(LocationsViewModel())
    }
}

extension LocationPreviewView {
    
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(location.breakType)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton: some View {
        Button {
            vm.sheetLocation = location
        } label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var surfedButton: some View {
        Button {
            if saved.surfed.contains(location.name) {
                saved.removeSurfed(location: location.name)
            } else {
                saved.addSurfed(location: location.name)
            }
        } label: {
            if saved.surfed.contains(location.name) {
                Image("surfed-filled")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 35)
            } else {
                Image("surfed")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 35)
            }
        }
        .buttonStyle(.bordered)
    }
    
    private var bookmarkButton: some View {
        Button {
            if saved.bookmarked.contains(location.name) {
                saved.removeBookmark(location: location.name)
            } else {
                saved.addBookmark(location: location.name)
            }
        } label: {
            if saved.bookmarked.contains(location.name) {
                Image(systemName: "bookmark.square.fill")
                    .font(.largeTitle)
                    .frame(width: 40, height: 35)
            } else {
                Image(systemName: "bookmark.square")
                    .font(.largeTitle)
                    .frame(width: 40, height: 35)
            }
        }
        .buttonStyle(.bordered)
    }
    
}
