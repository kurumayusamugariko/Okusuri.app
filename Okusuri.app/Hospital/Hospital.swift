//
//  Hospital.swift
//  Okusuri.app
//
//  Created by 的場安美 on 2024/04/26.
//

import SwiftUI

struct Hospital: View {
    @StateObject var modelData = DB3()
    @State private var isShowingAddMedicine = false
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    var body: some View {
        VStack {
            Text("病院リスト")
            
            NavigationView {
                Button(action: {
                    isShowingAddMedicine = true // 追加ボタンがタップされた時に追加画面を表示
                }) {
                    Text("病院を追加")
                        .foregroundColor(Color.white)
                        .padding(.all)
                        .background(.blue)
                        .cornerRadius(50.0)
                }
                .sheet(isPresented: $isShowingAddMedicine) {
                    addHospital(modelDB: modelData)
                }
            }
            
            ScrollView {
                VStack {
                    ForEach(modelData.cards) { card in
                        HStack {
                            Text(self.dateFormatter.string(from: card.dates))
                            Text(card.name)
                            Text(card.number)
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
    Hospital()
}
