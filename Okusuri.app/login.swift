//
//  login.swift
//  Okusuri.app
//
//  Created by light neon on 2024/04/28.
//

import SwiftUI

struct login: View {
    var body: some View {
        NavigationStack{
            NavigationLink(destination: Home()) {
                Image(.okusuri)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .foregroundColor(Color(hue: 1.0, saturation: 0.103, brightness: 0.97))
            }
        }
    }
}


#Preview {
    ContentView()
}
