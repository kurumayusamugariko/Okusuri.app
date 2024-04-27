import SwiftUI

struct addMedicine: View {
    @State var selectedDate: Date = Date()
    @State var inputName = ""
    @State var hospitalName = ""
    @State var explain = ""
    @ObservedObject var modelDB : DB
    @Environment(\.presentationMode) var presentation
    
    init(modelDB: DB) {
        self.modelDB = modelDB
    }
    
    var body: some View {
        Text("お薬を追加")
        
        VStack {
            DatePicker("日付", selection: $modelDB.selectedDate, displayedComponents: .date)
                .environment(\.locale, Locale(identifier: "ja_JP"))
                .fixedSize()
            
            
            TextField("薬の正式名称を入力してください", text: $modelDB.kind)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.all)
            
            TextField("病院名を入力してください", text: $modelDB.hospital_name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.all)
            
            TextField("薬の説明を入力してください", text: $modelDB.explain)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.all)
            
            
//            Button("追加") {
//                modelDB.addData(presentation: presentation)
//            }
            Button(action: {modelDB.addData(presentation: presentation)}, label: {
                Text("追加")
            })
        }
    }
}
    


//#Preview {
//    addMedicine()
//}
