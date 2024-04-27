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
    @State private var isShowingEditMedicine = false
    @State private var cardToEdit: Card2?
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    var body: some View {
        VStack {
            Text("病院一覧")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(hue: 0.577, saturation: 0.631, brightness: 0.224))
            
            NavigationView {
                Button(action: {
                    isShowingAddMedicine = true // 追加ボタンがタップされた時に追加画面を表示
                }) {
                    Text("病院を追加")
                        .foregroundColor(Color.white)
                        .padding(.all)
                        .frame(width: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/70.0/*@END_MENU_TOKEN@*/)
                        .background(.blue)
                        .cornerRadius(50.0)
                }
                .sheet(isPresented: $isShowingAddMedicine) {
                    addHospital(modelDB: modelData)
                }
            }
            .frame(width: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/, height: 70)
            
            
            
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(modelData.cards) { card in
                        HStack {
                            Text(self.dateFormatter.string(from: card.dates))
                            Text(card.name)
                            Text(card.number)
                                .multilineTextAlignment(.leading)
                        }
                        .contentShape(RoundedRectangle(cornerRadius: 10))
                        .contextMenu(menuItems: {
                            Button(action: {modelData.deleteData(object: card)}, label: {
                                Text("削除")
                                    .font(.title)
                                    .foregroundColor(Color.red)
                                    .multilineTextAlignment(.center)
                            })
                            Button(action: {
                                cardToEdit = card // 編集するカードを設定
                                isShowingEditMedicine = true // 編集画面を表示
                         
                            }, label: {
                                Text("編集")
                            })
                            Link(destination: URL(string: "tel:\(card.number)")!) {
                            Text("電話をかける")
                            Image(systemName: "phone").foregroundColor(.blue)
                            }
                        })
                        
                    }
                    .padding(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/)
                }
                .padding(/*@START_MENU_TOKEN@*/.top/*@END_MENU_TOKEN@*/)
                
            }.sheet(isPresented: $isShowingEditMedicine) {
                editHospital(modelDB: modelData, card: $cardToEdit)
            }

        }
        .padding()
    }
}

#Preview {
    Hospital()
}
