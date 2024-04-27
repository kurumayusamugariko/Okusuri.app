//
//  Hospital.swift
//  Okusuri.app
//
//  Created by 的場安美 on 2024/04/26.
//

import SwiftUI

struct Hospital: View {
    var body: some View {
        NavigationView {
            NavigationLink{ addHospital()} label:{
                Text("追加")
            } .foregroundColor(Color.white)
                .padding(.all)
                .background(.blue)
                .cornerRadius(50.0)
            
        }
    }
}

#Preview {
    Hospital()
}
