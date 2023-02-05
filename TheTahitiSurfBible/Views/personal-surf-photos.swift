//
//  personal-surf-photos.swift
//  TheTahitiSurfBible
//
//  Created by Jerad Acosta on 1/26/23.
//

import SwiftUI

struct personal_surf_photos: View {
    var body: some View {
        Image("photography_view_icon")
            .resizable()
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.width)
            .clipped()
    }
}

struct personal_surf_photos_Previews: PreviewProvider {
    static var previews: some View {
        personal_surf_photos()
    }
}
