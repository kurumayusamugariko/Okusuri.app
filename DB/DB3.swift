import SwiftUI
import RealmSwift


//medicineのデータベース操作
class DB3: ObservableObject{
    
    @Published var selectedDate: Date = Date()
    @Published var shouldNavigateToContentView = false
    
    @Published var dates = ""
    @Published var name = ""
    @Published var number = ""
    @Published var favorite = ""
    
    
    //realmに書き込む
    @Published var cards : [Card2] = []
    
    @Published var updateObject : Card2?
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let dbRef = try? Realm() else {
                print("Realmへのアクセスに失敗しました")
                return
            }
        
        let results = dbRef.objects(Card2.self)
        
        self.cards = results.compactMap({(card) -> Card2? in
            return card
        })
            
            // データが適切に読み込まれていることをコンソールに出力
            print("Fetched cards: \(self.cards)")
    }
    
    //realmを使えるように設定
    func addData(presentation: Binding<PresentationMode>) {
        
        let card = Card2()
        card.dates = selectedDate
        card.name = name
        card.number = number
        card.favorite = favorite
        
//        print("dates:", selectedDate)
//        print("kind:", kind)
//        print("hospital_name:", hospital_name)
//        print("explain:", explain)
//        print(card)
        
        guard let dbRef = try? Realm() else { return }
        
        try? dbRef.write{
            dbRef.add(card)
            print("データが追加されました")
            
            fetchData()
        }
        
        presentation.wrappedValue.dismiss()
    }
    
    func deleteData(object: Card2) {
        guard let dbRef = try? Realm() else { return }
        
        try? dbRef.write {
            dbRef.delete(object)
            fetchData()
        }
    }
    
    func editData(object: Card2){
       guard let dbRef = try? Realm() else { return }
    
        try? dbRef.write {
            object.dates = selectedDate
            object.name = name
            object.number = number
            object.favorite = favorite

            fetchData()            
//            print("dates:", object.dates)
//            print("hospital_name:", object.name)
//            print("phonenumber:",object.number)
//            print("データが更新されました")
        } 
    }
        
}
