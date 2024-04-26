import SwiftUI
import RealmSwift

class DB: ObservableObject{
    
    @Published var selectedDate: Date = Date()
    @Published var shouldNavigateToContentView = false
    
    @Published var dates = ""
    @Published var kind = ""
    @Published var hospital_name = ""
    @Published var explain = ""
    
    
    //realmに書き込む
    @Published var cards : [Card] = []
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let dbRef = try? Realm() else {
                print("Realmへのアクセスに失敗しました")
                return
            }
        
        let results = dbRef.objects(Card.self)
        
        self.cards = results.compactMap({(card) -> Card? in
            return card
        })
            
            // データが適切に読み込まれていることをコンソールに出力
            print("Fetched cards: \(self.cards)")
    }
    
    //realmを使えるように設定
    func addData() {
        
        let card = Card()
        card.dates = selectedDate
        card.kind = kind
        card.hospital_name = hospital_name
        card.explain = explain
        
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
        
    }
}
