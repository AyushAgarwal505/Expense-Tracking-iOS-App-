//
//  CardView.swift
//  TrackIt
//
//  Created by Ayush Agarwal on 10/06/24.
//

import SwiftUI

struct CardView: View {
    var income: Double
    var expense : Double
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .fill(.background)
            VStack{
                HStack{
                    Text("\(currencyString(value: income-expense))")
                        .font(.title.bold())
                    Image(systemName: expense>income ? "chart.line.downtrend.xyaxis" : "chart.line.uptrend.xyaxis")
                        .font(.title3)
                        .foregroundStyle(expense>income ? .red: .green)
                }
                .padding(.bottom, 25)
                HStack{
                    ForEach(Category.allCases, id:\.rawValue){ category in
                        let symbolImage =  (category == .income) ? "arrow.down" : "arrow.up"
                        let tint = (category == .income) ? Color.green: Color.red
                        HStack{
                            Image(systemName: symbolImage)
                                .font(.callout.bold())
                                .foregroundStyle(tint)
                                .frame(width: 35, height: 35)
                                .background{
                                    Circle()
                                        .fill(tint.opacity(0.2))
                                }
                            VStack{
                                Text(category.rawValue)
                                    .font(.callout)
                                    .foregroundStyle(.gray)
                                Text(currencyString(value: (category == .income) ? income: expense))
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.primary)
                                
                            }
                            if category == .income{
                                Spacer()
                            }
                        }
                    }
                }
            }
            .padding([.horizontal, .bottom], 25 )
            .padding(.top, 15)
        }
    }
}

#Preview {
    CardView(income: 1000, expense: 500)
}
