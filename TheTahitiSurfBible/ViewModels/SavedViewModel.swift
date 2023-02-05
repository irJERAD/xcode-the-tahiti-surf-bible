//
//  SavedViewModel.swift
//  TheTahitiSurfBible
//
//  Created by Jerad Acosta on 1/9/23.
//

import Foundation

class SavedViewModel: ObservableObject {
    
    @Published var surfed: [String] = [] {
        didSet {
            saveSurfed()
        }
    }
    @Published var bookmarked: [String] = [] {
        didSet {
            saveBookmarked()
        }
    }
    
    let surfedKey: String = "surfed_key"
    let bookmarkedKey: String = "bookmarked_key"
    
    init() {
        getData()
    }
    
    func getData() {
        guard
            let surfedData = UserDefaults.standard.data(forKey: surfedKey),
            let savedSurfed = try? JSONDecoder().decode([String].self, from: surfedData)
        else { return }
        
        self.surfed = savedSurfed
        
        guard
            let bookmarkedData = UserDefaults.standard.data(forKey: bookmarkedKey),
            let bookmarkedSurfed = try? JSONDecoder().decode([String].self, from: bookmarkedData)
        else { return }
        
        self.bookmarked = bookmarkedSurfed
    }
    
    // Add To Surfed
    func addSurfed(location: String) {
        surfed.append(location)
    }
    // Add to bookmarked
    func addBookmark(location: String) {
        bookmarked.append(location)
    }
    // Remove From Surfed
    func removeSurfed(location: String) {
        surfed = surfed.filter { $0 != location }
    }
    // Remove From Bookmarked
    func removeBookmark(location: String) {
        bookmarked = bookmarked.filter { $0 != location }
    }
    
    // Save Data
    func saveSurfed() {
        if let encodedsurfedData = try? JSONEncoder().encode(surfed) {
            UserDefaults.standard.set(encodedsurfedData, forKey: surfedKey)
        }
    }
    func saveBookmarked() {
        if let encodedbookmarkedData = try? JSONEncoder().encode(bookmarked) {
            UserDefaults.standard.set(encodedbookmarkedData, forKey: bookmarkedKey)
        }
    }
    
}

