//
//  addHospital.swift
//  Okusuri.app
//
//  Created by 的場安美 on 2024/04/27.
//

import SwiftUI

struct addHospital: View {
    @State var selectedDate: Date = Date()
    
    @ObservedObject var modelDB : DB3
    @Environment(\.presentationMode) var presentation
    
    init(modelDB: DB3) {
        self.modelDB = modelDB
    }
    
    var body: some View {
        VStack {
            
            DatePicker("日付", selection: $modelDB.selectedDate, displayedComponents: .date)
                .environment(\.locale, Locale(identifier: "ja_JP"))
                .fixedSize()
            
            TextField("病院名を記載してください", text: $modelDB.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.all)
            
            TextField("病院の電話番号を記載してください", text: $modelDB.number)
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
//    addHospital()
//}
