import SwiftUI
import RealmSwift


//medicineのデータベース操作
class DB4: ObservableObject{
    
    @Published var selectedDate: Date = Date()
    @Published var shouldNavigateToContentView = false
    
    @Published var dates = ""
    @Published var disease = ""
    @Published var hospital_name = ""
    
    
    //realmに書き込む
    @Published var cards : [Card3] = []
    
    @Published var updateObject : Card3?
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let dbRef = try? Realm() else {
                print("Realmへのアクセスに失敗しました")
                return
            }
        
        let results = dbRef.objects(Card3.self)
        
        self.cards = results.compactMap({(card) -> Card3? in
            return card
        })
            
            // データが適切に読み込まれていることをコンソールに出力
            print("Fetched cards: \(self.cards)")
    }
    
    //realmを使えるように設定
    func addData(presentation: Binding<PresentationMode>) {
        
        let card = Card3()
        card.dates = selectedDate
        card.disease = disease
        card.hospital_name = hospital_name
        
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
    
    func deleteData(object: Card3) {
        guard let dbRef = try? Realm() else { return }
        
        try? dbRef.write {
            dbRef.delete(object)
            fetchData()
        }
    }
        
}
