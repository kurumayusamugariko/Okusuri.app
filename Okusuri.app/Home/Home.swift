//
//  Home.swift
//  Okusuri.app
//
//  Created by 的場安美 on 2024/04/26.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
        NavigationView {
            VStack {
                Text("名前")
                HStack {
                    Text("誕生日")
                    Text("血液型")
                } .padding(.all)
                
                HStack {
                    
                    NavigationLink{ info_medicine()} label:{
                        Text("飲んでいるお薬")
                    } .padding(.all, 10)
                    
                    NavigationLink{ info_medicine()} label:{
                        Text("病院一覧")
                    } .padding(.all, 10)
                }
                
                
                HStack {
                    
                    NavigationLink{ info_medicine()} label:{
                        Text("病歴")
                    } .padding(.all, 10)
                    
                    
                    
                    NavigationLink{ info_medicine()} label:{
                        Text("アレルギー一覧")
                    } .padding(.all, 10)
                }
            }
            
        }
    }
}

#Preview {
    Home()
}
