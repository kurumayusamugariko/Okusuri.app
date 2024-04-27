//
//  addAllergy.swift
//  Okusuri.app
//
//  Created by 的場安美 on 2024/04/27.
//

import SwiftUI

struct addAllergy: View {
    @State var inputName = ""
    @ObservedObject var modelDB : DB2
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            TextField("アレルギー項目を記入してください", text: $modelDB.Allergy)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.all)
            
            TextField("種類を選択してください", text: $modelDB.kind)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.all)
            
            Button(action: {modelDB.addData(presentation: presentation)}, label: {
                Text("追加")
            })
        }
    }
}

//#Preview {
//    addAllergy()
//}
