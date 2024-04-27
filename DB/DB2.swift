import SwiftUI
import RealmSwift

//アレルギーのデータベースの操作
class DB2: ObservableObject{
    @Published var shouldNavigateToContentView = false
    
    @Published var Allergy = ""
    @Published var kind = ""
    
    
    //realmに書き込む
    @Published var cards : [Card4] = []
    
    @Published var updateObject : Card4?
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let dbRef = try? Realm() else {
                print("Realmへのアクセスに失敗しました")
                return
            }
        
        let results = dbRef.objects(Card4.self)
        
        self.cards = results.compactMap({(card) -> Card4? in
            return card
        })
            
            // データが適切に読み込まれていることをコンソールに出力
            print("Fetched cards: \(self.cards)")
    }
    
    //realmを使えるように設定
    func addData(presentation: Binding<PresentationMode>) {
        
        let card = Card4()
        card.Allergy = Allergy
        card.kind = kind
        
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
    
    func deleteData(object: Card4) {
        guard let dbRef = try? Realm() else { return }
        
        try? dbRef.write {
            dbRef.delete(object)
            fetchData()
        }
    }
        
}
