//
//  Name.swift
//  Okusuri.app
//
//  Created by 的場安美 on 2024/04/27.
//

import SwiftUI

struct Name: View {
    @StateObject var modelData = DB5()
    @State private var isShowingAddMedicine = false
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            TextField("名前を記入してください", text: $modelData.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.all)
            
            TextField("誕生日を記入してください", text: $modelData.birth)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.all)
            
            TextField("血液型を記入してください", text: $modelData.blood)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.all)
            
            Button(action: {modelData.addData(presentation: presentation)}, label: {
                Text("追加")
            })
        }
    }
}

#Preview {
    Name()
}
