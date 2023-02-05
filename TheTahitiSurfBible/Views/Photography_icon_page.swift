//
//  Photography_icon_page.swift
//  TheTahitiSurfBible
//
//  Created by Jerad Acosta on 1/26/23.
//

import SwiftUI

struct Photography_icon_page: View {
    var body: some View {
        Image("Photography_icon_page")
            .resizable()
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.width)
            .clipped()
    }
}

struct Photography_icon_page_Previews: PreviewProvider {
    static var previews: some View {
        Photography_icon_page()
    }
}
