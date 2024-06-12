//
//  Transaction.swift
//  TrackIt
//
//  Created by Ayush Agarwal on 10/06/24.
//

import SwiftUI
import SwiftData

@Model

class Transaction{
    var title: String
    var remarks: String
    var amount: Double
    var dateAdded: Date
    var category: String
    var tintColor: String
    
    init(title: String, remarks: String, amount: Double, dateAdded: Date, category: Category, tintColor: TintColor) {
        self.title = title
        self.remarks = remarks
        self.amount = amount
        self.dateAdded = dateAdded
        self.category = category.rawValue
        self.tintColor = tintColor.color
    }
    @Transient
    var color: Color{
        return tints.first(where: {$0.color == tintColor})?.value ?? .blue
    }
    @Transient
    var rawCategory: Category?{
        return Category.allCases.first(where: { category == $0.rawValue})
    }
    @Transient
    var tint: TintColor?{
        return tints.first(where: {$0.color == tintColor})
    }
}

