//
//  Medical_history.swift
//  Okusuri.app
//
//  Created by 的場安美 on 2024/04/26.
//

import SwiftUI

struct Medical_history: View {
    var body: some View {
        NavigationView {
            NavigationLink{ AddMedical_history()} label:{
                Text("追加")
            } .foregroundColor(Color.white)
                .padding(.all)
                .background(.blue)
                .cornerRadius(50.0)
            
        }
    }
}

#Preview {
    Medical_history()
}
