//
//  TintColor.swift
//  TrackIt
//
//  Created by Ayush Agarwal on 10/06/24.
//

import SwiftUI

struct TintColor{
    var color: String
    var value: Color
}

var tints: [TintColor] = [
    .init(color: "Red", value: .red),
    .init(color: "Blue", value: .blue),
    .init(color: "Pink", value: .pink),
    .init(color: "Brown", value: .brown),
    .init(color: "Orange", value: .orange),
    .init(color: "Purple", value: .purple)
]
