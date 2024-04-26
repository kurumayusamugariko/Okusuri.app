//
//  Home.swift
//  Okusuri.app
//
//  Created by 的場安美 on 2024/04/26.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            Text("名前")
            HStack {
                Text("誕生日")
                Text("血液型")
            }
        }
        
        VStack {
            
            HStack {
                Button("飲んでいる薬") {
                    info_medicine()
                }
                
                Button("病院一覧") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
            }
            
            HStack {
                Button("病歴") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                
                Button("アレルギー一覧") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
            }
            
        }
    }
}

#Preview {
    Home()
}
