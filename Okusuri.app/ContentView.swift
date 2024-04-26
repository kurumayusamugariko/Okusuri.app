//
//  ContentView.swift
//  Okusuri.app
//
//  Created by light neon on 2024/04/21.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    @StateObject var modelData = DB()
    @State private var isShowingAddMedicine = false
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    var body: some View {
        Text("お薬リスト")
    }
}


#Preview {
    ContentView()
}
