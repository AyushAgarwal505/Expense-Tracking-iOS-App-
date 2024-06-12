//
//  TransactionCardView.swift
//  TrackIt
//
//  Created by Ayush Agarwal on 10/06/24.
//

import SwiftUI

struct TransactionCardView: View {
    var transaction: Transaction
    var body: some View {
        HStack{
            Text("\(String(transaction.title.prefix(1)))")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(width: 45, height: 45)
                .background(transaction.color, in: .circle)
            VStack(alignment: .leading){
                Text(transaction.title)
                    .foregroundStyle(Color.primary)
                Text(transaction.remarks)
                    .foregroundStyle(Color.primary.secondary)
                    .font(.caption)
                Text(format (date: transaction.dateAdded, format: "dd MMM"))
                    .font(.caption2)
                    .foregroundStyle(.gray)
            }
            .lineLimit(1)
            .hSpacing(alignment: .leading)
            Text("\(currencyString(value: transaction.amount))")
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(.background, in: .rect(cornerRadius: 10))
    }
}

