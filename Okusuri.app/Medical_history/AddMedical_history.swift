//
//  AddMedical_history.swift
//  Okusuri.app
//
//  Created by 的場安美 on 2024/04/27.
//

import SwiftUI

struct AddMedical_history: View {
    @State var selectedDate: Date = Date()
    @ObservedObject var modelDB : DB4
    @Environment(\.presentationMode) var presentation
    
    init(modelDB: DB4) {
        self.modelDB = modelDB
    }
    
    var body: some View {
        Text("病歴を追加")
        
        VStack {
            DatePicker("日付", selection: $modelDB.selectedDate, displayedComponents: .date)
                .environment(\.locale, Locale(identifier: "ja_JP"))
                .fixedSize()
            
            
            TextField("病名を入力してください", text: $modelDB.disease)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.all)
            
            TextField("病院名を入力してください", text: $modelDB.hospital_name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.all)
            
//            Button("追加") {
//                modelDB.addData(presentation: presentation)
//            }
            Button(action: {modelDB.addData(presentation: presentation)}, label: {
                Text("追加")
            })
        }
    }
}

//#Preview {
//    AddMedical_history()
//}
