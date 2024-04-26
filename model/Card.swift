//
//  Card.swift
//  Okusuri.app
//
//  Created by 的場安美 on 2024/04/26.
//

import SwiftUI
import RealmSwift

class Card: Object, Identifiable {
    
    @objc dynamic var id : Date = Date()
    @objc dynamic var dates: Date = Date()
    @objc dynamic var kind = ""
    @objc dynamic var hospital_name = ""
    @objc dynamic var explain = ""
}
