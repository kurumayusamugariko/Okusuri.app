//
//  Card.swift
//  Okusuri.app
//
//  Created by 的場安美 on 2024/04/26.
//

import SwiftUI
import RealmSwift

//薬のデータベース
class Card: Object, Identifiable {
    
    @objc dynamic var id : Date = Date()
    @objc dynamic var dates: Date = Date()
    @objc dynamic var kind = ""
    @objc dynamic var hospital_name = ""
    @objc dynamic var explain = ""
}


//病院のデータベース
//class Card2: Object, Identifiable {
//    
//    @objc dynamic var id : Date = Date()
//    @objc dynamic var name = ""
//    @objc dynamic var number = ""
//    @objc dynamic var favorite = ""
//}


//病歴のデータベース
//class Card3: Object, Identifiable {
//    
//    @objc dynamic var id : Date = Date()
//    @objc dynamic var dates: Date = Date()
//    @objc dynamic var disease = ""
//    @objc dynamic var hospital_name = ""
//}


//アレルギーのデータベース
