//
//  allergy.swift
//  Okusuri.app
//
//  Created by 的場安美 on 2024/04/26.
//

import SwiftUI

struct allergy: View {
    
    @StateObject var modelData = DB2()
    @State private var isShowingAddMedicine = false
    
    var body: some View {
        VStack {
            Text("アレルギーリスト")
            
            NavigationView {
                Button(action: {
                    isShowingAddMedicine = true // 追加ボタンがタップされた時に追加画面を表示
                }) {
                    Text("アレルギーを追加")
                        .foregroundColor(Color.white)
                        .padding(.all)
                        .background(.blue)
                        .cornerRadius(50.0)
                }
                .sheet(isPresented: $isShowingAddMedicine) {
                    addAllergy(modelDB: modelData)
                }
            }
            
            ScrollView {
                VStack {
                    ForEach(modelData.cards) { card in
                        HStack {
                            Text(card.Allergy)
                            Text(card.kind)
                        }
                        .contentShape(RoundedRectangle(cornerRadius: 10))
                        .contextMenu(menuItems: {
                            Button(action: {modelData.deleteData(object: card)}, label: {
                                Text("Delete")
                            })
                        })
                        
                    }.padding()
                }
                
            }

        }
        .padding()
    }
}

#Preview {
    allergy()
}
