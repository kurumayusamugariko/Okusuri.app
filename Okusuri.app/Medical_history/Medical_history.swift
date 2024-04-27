//
//  Medical_history.swift
//  Okusuri.app
//
//  Created by 的場安美 on 2024/04/26.
//

import SwiftUI

struct Medical_history: View {
    @StateObject var modelData = DB4()
    @State private var isShowingAddMedicine = false
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    var body: some View {
        VStack {
            Text("病歴")
            
            NavigationView {
                Button(action: {
                    isShowingAddMedicine = true // 追加ボタンがタップされた時に追加画面を表示
                }) {
                    Text("病歴を追加")
                        .foregroundColor(Color.white)
                        .padding(.all)
                        .background(.blue)
                        .cornerRadius(50.0)
                }
                .sheet(isPresented: $isShowingAddMedicine) {
                    AddMedical_history(modelDB: modelData)
                }
            }
            
            ScrollView {
                VStack {
                    ForEach(modelData.cards) { card in
                        HStack {
                            Text(self.dateFormatter.string(from: card.dates))
                            Text(card.disease)
                            Text(card.hospital_name)
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
    Medical_history()
}
