//
//  View+Extensions.swift
//  TrackIt
//
//  Created by Ayush Agarwal on 10/06/24.
//

import SwiftUI

extension View{
    @ViewBuilder
    func hSpacing(alignment: Alignment = .center) -> some View{
        self.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: alignment)
    }
    func vSpacing(alignment: Alignment = .center) -> some View{
        self.frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: alignment)
    }
    func format(date:Date, format:String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    func currencyString(value: Double, allowedDigits: Int = 2)-> String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = allowedDigits
        return formatter.string(from: .init(value: value)) ?? ""
    }
}
