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
                NavigationView {
                    NavigationLink(destination: info_medicine()) {
                        Text("飲んでいるお薬")
                    }
                }
                
                NavigationView {
                    NavigationLink(destination: info_medicine()) {
                        Text("病院一覧")
                    }
                }
            }
            
            HStack {
                NavigationView {
                    NavigationLink(destination: info_medicine()) {
                        Text("病歴")
                    }
                }
                
                NavigationView {
                    NavigationLink(destination: info_medicine()) {
                        Text("アレルギー一覧")
                    }
                }
            }
            
        }
    }
}

#Preview {
    Home()
}
