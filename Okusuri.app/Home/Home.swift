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
                            .foregroundColor(Color.gray)
                            .background(Color.white)
                            .cornerRadius(20.0)
                            
                        }
                        .sheet(isPresented: $isShowingAddMedicine) {
                            Name(modelData: modelData)
                            
                        }
                    }
                    .frame(width: 300.0, height: 100.0)
                    .cornerRadius(20.0)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .padding(/*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
                    
                    
                    
                    
                    HStack {
                        
                        NavigationLink{ info_medicine()} label:{
                            VStack{
                                Text("お薬一覧")
                                    .fontWeight(.medium)
                                Image(.medicine)
                                    .frame(width: /*@START_MENU_TOKEN@*/90.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                            }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).border(/*@START_MENU_TOKEN@*/Color(hue: 0.839, saturation: 0.388, brightness: 0.866)/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/).cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        } .padding(.all, 10).frame(width: 170.0/*@END_MENU_TOKEN@*/, height: 170.0).background(Color.white).cornerRadius(/*@START_MENU_TOKEN@*/20.0)
                        
                        NavigationLink{ Hospital()} label:{
                            VStack{
                                Text("病院一覧")
                                    .fontWeight(.medium)
                                Image(.doctor)
                                    .frame(width: /*@START_MENU_TOKEN@*/90.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                            }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).border(/*@START_MENU_TOKEN@*/Color(hue: 0.318, saturation: 0.401, brightness: 0.698)/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/).cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        } .padding(.all, 10).frame(width: 170.0/*@END_MENU_TOKEN@*/, height: 170.0).background(Color.white).cornerRadius(/*@START_MENU_TOKEN@*/20.0)
                    }
                    
                    
                    HStack {
                        
                        NavigationLink{ Medical_history()} label:{
                            VStack{
                                Text("病歴")
                                    .fontWeight(.medium)
                                Image(.list)
                                    .padding(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    .frame(width: /*@START_MENU_TOKEN@*/80.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                            }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).border(/*@START_MENU_TOKEN@*/Color(hue: 0.108, saturation: 0.401, brightness: 0.698)/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/).cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        } .padding(.all, 10).frame(width: 170.0/*@END_MENU_TOKEN@*/, height: 170.0).background(Color.white).cornerRadius(/*@START_MENU_TOKEN@*/20.0)
                        
                        
                        
                        NavigationLink{ allergy()} label:{
                            VStack{
                                Text("アレルギー")
                                    .fontWeight(.medium)
                                Image(.heart)
                                    .frame(width: /*@START_MENU_TOKEN@*/90.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                            }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).border(/*@START_MENU_TOKEN@*/Color.yellow/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/).cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        } .padding(.all, 10).frame(width: 170.0/*@END_MENU_TOKEN@*/, height: 170.0).background(Color.white).cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    }
                        NavigationLink{ custam()} label:{
                        Text("カスタマイズ")
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            .frame(width: 200.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0)
                            .background(Color(hue: 0.101, saturation: 0.36, brightness: 0.926))
                            .cornerRadius(20.0)
                            .padding(/*@START_MENU_TOKEN@*/.all, 30.0/*@END_MENU_TOKEN@*/)
                        }
                    
                    
                    
                }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).foregroundColor(.black).background(Color(red: 0xF7/255, green: 0xF5/255, blue: 0xF0/255))
                
            }
            
        }.navigationBarBackButtonHidden(true)
    }
}
    
    #Preview {
        Home()
    }
