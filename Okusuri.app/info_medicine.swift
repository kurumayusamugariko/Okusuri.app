//
//  info_medicine.swift
//  Okusuri.app
//
//  Created by 的場安美 on 2024/04/26.
//

import SwiftUI

struct info_medicine: View {
    
    @StateObject var modelData = DB()
    @State private var isShowingAddMedicine = false
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    var body: some View {
        VStack {
            Text("お薬リスト")
            
            NavigationView {
                Button(action: {
                    isShowingAddMedicine = true // 追加ボタンがタップされた時に追加画面を表示
                }) {
                    Text("お薬を追加")
                        .foregroundColor(Color.white)
                        .padding(.all)
                        .background(.blue)
                        .cornerRadius(50.0)
                }
                .sheet(isPresented: $isShowingAddMedicine) {
                    addMedicine(modelDB: modelData)
                }
            }
            
            ScrollView {
                VStack {
                    ForEach(modelData.cards) { card in
                        HStack {
                            Text(self.dateFormatter.string(from: card.dates))
                            Text(card.kind)
                            Text(card.hospital_name)
                            Text(card.explain)
                        }
                        
                    }.padding()
                }
                
            }

        }
        .padding()
    }
}

#Preview {
    info_medicine()
}
