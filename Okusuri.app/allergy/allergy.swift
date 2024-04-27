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
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            NavigationView {
                Button(action: {
                    isShowingAddMedicine = true // 追加ボタンがタップされた時に追加画面を表示
                }) {
                    Text("アレルギーを追加")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.all)
                        .frame(width: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/70.0/*@END_MENU_TOKEN@*/)
                        .background(Color(hue: 0.161, saturation: 0.831, brightness: 0.794))
                        .cornerRadius(50.0)
                }
                .sheet(isPresented: $isShowingAddMedicine) {
                    addAllergy(modelDB: modelData)
                }
            }
            .frame(width: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/70.0/*@END_MENU_TOKEN@*/)
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(modelData.cards) { card in
                        HStack {
                            Text(card.Allergy)
                                .font(.headline)
                            Text(card.kind)
                                .fontWeight(.bold)
                                .foregroundColor(Color(hue: 0.077, saturation: 0.657, brightness: 0.656))
                        }
                        Divider()
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            .contentShape(RoundedRectangle(cornerRadius: 10))
                        .contextMenu(menuItems: {
                            Button(action: {modelData.deleteData(object: card)}, label: {
                                Text("Delete")
                                    .font(.body)
                                    .fontWeight(.regular)
                                    .foregroundColor(Color(hue: 0.098, saturation: 0.922, brightness: 0.279))
                            })
                        })
                        
                    }
                    
                }
                
                
                
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
    }
}

#Preview {
    allergy()
}
