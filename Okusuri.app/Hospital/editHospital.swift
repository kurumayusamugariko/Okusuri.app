//
//  addHospital.swift
//  Okusuri.app
//
//  Created by 的場安美 on 2024/04/27.
//

import SwiftUI

struct editHospital: View {
    @State var selectedDate: Date = Date()
    
    @ObservedObject var modelDB : DB3
    @Binding var card: Card2? // 編集するカードのバインディング
    @Environment(\.presentationMode) var presentation
    
    init(modelDB: DB3, card: Binding<Card2?>) {
        self.modelDB = modelDB
        self._card = card
    }
    
    var body: some View {
        VStack {
            
            DatePicker("次回の日付", selection: $selectedDate, displayedComponents: .date)
                .environment(\.locale, Locale(identifier: "ja_JP"))
                .fixedSize()
            
            TextField("病院名を記載してください", text: $modelDB.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.all)
            
            TextField("病院の電話番号を記載してください", text: $modelDB.number)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.all)
            
            Button(action: {
                if let card = card {
                    modelDB.editData(object: card)
                }
                presentation.wrappedValue.dismiss()
            }, label: {
                Text("変更")
            })
        }
        .onAppear {
            if let card = card {
                selectedDate = card.dates
                modelDB.name = card.name
                modelDB.number = card.number
                // 他のプロパティも同様に設定します
            }
        }
    }
}

//#Preview {
//    editHospital()
//}
