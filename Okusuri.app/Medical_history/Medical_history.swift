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
    formatter.dateStyle = .medium
    formatter.timeStyle = .none
    formatter.locale = Locale(identifier: "ja_JP")
    return formatter
    }()
    
    var body: some View {
        VStack {
            Text("病歴")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            NavigationView {
                Button(action: {
                    isShowingAddMedicine = true // 追加ボタンがタップされた時に追加画面を表示
                }) {
                    Text("病歴を追加")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.all)
                        .frame(width: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/70.0/*@END_MENU_TOKEN@*/)
                        .background(/*@START_MENU_TOKEN@*/Color(hue: 0.108, saturation: 0.401, brightness: 0.698)/*@END_MENU_TOKEN@*/)
                        .cornerRadius(50.0)

                }
                .sheet(isPresented: $isShowingAddMedicine) {
                    AddMedical_history(modelDB: modelData)
                }
            }
            .frame(width: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/, height: 70)
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(modelData.cards) { card in
                        Text(card.disease)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(/*@START_MENU_TOKEN@*/.top/*@END_MENU_TOKEN@*/)
                        HStack {
                            Text(self.dateFormatter.string(from: card.dates))
                            Text(card.hospital_name)
                        }
                        .contentShape(RoundedRectangle(cornerRadius: 10))
                        .contextMenu(menuItems: {
                            Button(action: {modelData.deleteData(object: card)}, label: {
                                Text("Delete")
                            })
                        })
                        
                    }
                }
                .padding(/*@START_MENU_TOKEN@*/.top/*@END_MENU_TOKEN@*/)
                
            }

        }
        
    }
}

#Preview {
    Medical_history()
}
