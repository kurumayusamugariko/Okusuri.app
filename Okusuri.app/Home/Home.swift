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
                            Text($modelData.name.wrappedValue)
                            Text($modelData.birth.wrappedValue)
                            Text($modelData.blood.wrappedValue)
                            
                            
                        }
                        .foregroundColor(Color.white)
                        .padding(.all)
                        .background(.blue)
                        .cornerRadius(50.0)
                        .sheet(isPresented: $isShowingAddMedicine) {
                            Name(modelData: modelData)
                                
                        }
                    }
                    
                    
                    HStack {
                        
                        NavigationLink{ info_medicine()} label:{
                            Text("飲んでいるお薬")
                        } .padding(.all, 10).frame(width: /*@START_MENU_TOKEN@*/170.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/170.0/*@END_MENU_TOKEN@*/).background(Color(hue: 0.611, saturation: 0.343, brightness: 1.0)).cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                        
                        NavigationLink{ Hospital()} label:{
                            Text("病院一覧")
                        } .padding(.all, 10).frame(width: /*@START_MENU_TOKEN@*/170.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/170.0/*@END_MENU_TOKEN@*/).background(Color(hue: 0.611, saturation: 0.343, brightness: 1.0)).cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    }
                    
                    
                    HStack {
                        
                        NavigationLink{ Medical_history()} label:{
                            Text("病歴")
                        } .padding(.all, 10).frame(width: /*@START_MENU_TOKEN@*/170.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/170.0/*@END_MENU_TOKEN@*/).background(Color(hue: 0.611, saturation: 0.343, brightness: 1.0)).cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                        
                        
                        
                        NavigationLink{ allergy()} label:{
                            Text("アレルギー一覧")
                        } .padding(.all, 10).frame(width: /*@START_MENU_TOKEN@*/170.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/170.0/*@END_MENU_TOKEN@*/).background(Color(hue: 0.611, saturation: 0.343, brightness: 1.0)).cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    }.padding(.bottom)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("カスタマイズ")
                            .multilineTextAlignment(.center)
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            .frame(width: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.51, saturation: 0.357, brightness: 0.913)/*@END_MENU_TOKEN@*/)
                            .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    })
                    
                }.foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                
            }
        }
    }
}
    
//    #Preview {
//        Home()
//    }
