//
//  addHospital.swift
//  Okusuri.app
//
//  Created by 的場安美 on 2024/04/27.
//

import SwiftUI

struct addHospital: View {
    @State var inputName = ""
    
    var body: some View {
        VStack {
            
            
            
            TextField("薬の正式名称を入力してください", text: $inputName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.all)
            
            TextField("病院名を入力してください", text: $inputName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.all)
            
            TextField("薬の説明を入力してください", text: $inputName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.all)
            
            //            Button("追加") {
            //                modelDB.addData(presentation: presentation)
            //            }
            Button(action: {}, label: {
                Text("追加")
            })
        }
    }
}

#Preview {
    addHospital()
}
