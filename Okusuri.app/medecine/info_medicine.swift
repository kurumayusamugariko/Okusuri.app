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
    formatter.dateStyle = .medium
    formatter.timeStyle = .none
    formatter.locale = Locale(identifier: "ja_JP")
    return formatter
    }()
    
    var body: some View {
        VStack {
            Text("お薬一覧").font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(hue: 0.577, saturation: 0.631, brightness: 0.224))
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            NavigationView {
                Button(action: {
                    isShowingAddMedicine = true // 追加ボタンがタップされた時に追加画面を表示
                }) {
                    Text("お薬を追加")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.all)
                        .frame(width: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/70.0/*@END_MENU_TOKEN@*/)
                        .background(/*@START_MENU_TOKEN@*/Color(hue: 0.839, saturation: 0.388, brightness: 0.866)/*@END_MENU_TOKEN@*/)
                        .cornerRadius(50.0)
                }
                .sheet(isPresented: $isShowingAddMedicine) {
                    addMedicine(modelDB: modelData)
                }
            }.frame(width: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/, height: 70)
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(modelData.cards) { card in
                        VStack(alignment: .leading){
                            Text(card.kind)
                                .font(.title3)
                                .fontWeight(.bold)
                            HStack {
                                Text(card.hospital_name)
                                Text("処方日:"+self.dateFormatter.string(from: card.dates))
                            }
                            Text("説明:"+card.explain)
                            
                        }
                        .contentShape(RoundedRectangle(cornerRadius: 10))
                        .contextMenu(menuItems: {
                            Button(action: {modelData.deleteData(object: card)}, label: {
                                Text("Delete")
                            })
                        })
                        Divider()
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

                    }

                }
                
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            

        }
        .padding()
    }
}

#Preview {
    info_medicine()
}
