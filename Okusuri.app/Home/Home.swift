//
//  Home.swift
//  Okusuri.app
//
//  Created by 的場安美 on 2024/04/26.
//

import SwiftUI

struct Home: View {
    @StateObject var modelData = DB5()
    @State private var isShowingAddMedicine = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                VStack{
                    NavigationView {
                        Button(action: {
                            isShowingAddMedicine = true // 追加ボタンがタップされた時に追加画面を表示
                        }) {
                            VStack {
                                Text($modelData.name.wrappedValue)
                                Text($modelData.birth.wrappedValue)
                                Text($modelData.blood.wrappedValue)
                            }
                            .frame(width: 300.0, height: 100.0)
                            .foregroundColor(Color.white)
                            .background(.blue)
                            .cornerRadius(20.0)
                            
                        }
                        .sheet(isPresented: $isShowingAddMedicine) {
                            Name(modelData: modelData)
                            
                        }
                    }
                    
                    
                    HStack {
                        
                        NavigationLink{ info_medicine()} label:{
                            Text("お薬一覧")
                        } .padding(.all, 10).frame(width: 170.0/*@END_MENU_TOKEN@*/, height: 170.0).background(Color(hue: 0.611, saturation: 0.343, brightness: 1.0)).cornerRadius(/*@START_MENU_TOKEN@*/20.0)
                        
                        NavigationLink{ Hospital()} label:{
                            Text("病院一覧")
                        } .padding(.all, 10).frame(width: 170.0/*@END_MENU_TOKEN@*/, height: 170.0).background(Color(hue: 0.611, saturation: 0.343, brightness: 1.0)).cornerRadius(/*@START_MENU_TOKEN@*/20.0)
                    }
                    
                    
                    HStack {
                        
                        NavigationLink{ Medical_history()} label:{
                            Text("病歴")
                        } .padding(.all, 10).frame(width: 170.0/*@END_MENU_TOKEN@*/, height: 170.0).background(Color(hue: 0.611, saturation: 0.343, brightness: 1.0)).cornerRadius(/*@START_MENU_TOKEN@*/20.0)
                        
                        
                        
                        NavigationLink{ allergy()} label:{
                            Text("アレルギー\n一覧")
                        } .padding(.all, 10).frame(width: 170.0/*@END_MENU_TOKEN@*/, height: 170.0).background(Color(hue: 0.611, saturation: 0.343, brightness: 1.0)).cornerRadius(/*@START_MENU_TOKEN@*/20.0)
                    }
                    Button(action: {}, label: {
                        Text("カスタマイズ")
                            .multilineTextAlignment(.center)
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            .frame(width: 200.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0)
                            .background(Color(hue: 0.51, saturation: 0.357, brightness: 0.913))
                            .cornerRadius(20.0)
                            .padding(/*@START_MENU_TOKEN@*/.all, 30.0/*@END_MENU_TOKEN@*/)
                    })
                    
                    
                    
                }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).foregroundColor(.black)
                
            }
            
        }
    }
}
    
    #Preview {
        Home()
    }
