//
//  IntroScreen.swift
//  TrackIt
//
//  Created by Ayush Agarwal on 10/06/24.
//

import SwiftUI

struct IntroScreen: View {
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    var body: some View {
        VStack(spacing:15){
            Text("What's New in the\nExpense Tracker")
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
                .padding(.top, 65)
                .padding(.bottom, 35)
            VStack(alignment: .leading, spacing: 25){
              //Points that are new
                PointView(symbol: "dollarsign", title: "Transaction", subTitle: "Keep track of your Earnings and Expenses")
                PointView(symbol: "chart.bar.fill", title: "Visual Charts", subTitle: "View your Transactions using Eye-Catching Graphic Representations")
                PointView(symbol: "magnifyingglass", title: "Advance Filters", subTitle: "Find the expenses you want by advance search and filtering")
                    
                }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding(.horizontal, 15)
            Spacer()
            Button {
                isFirstTime = false
            } label: {
            Text("Continue")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.white)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .padding(.vertical, 14)
                    .background(.blue)
                    .cornerRadius(12)
                    .contentShape(.rect)
                
            }
            }
        .padding(15)
        }
    @ViewBuilder
    func PointView(symbol:String, title:String, subTitle: String) -> some View{
        HStack{
            Image(systemName: symbol)
                .foregroundStyle(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .font(.largeTitle)
                .frame(width: 45)
            VStack(alignment:.leading, spacing: 4){
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(subTitle)
                    .foregroundStyle(.gray)
                
            }
        }
    }
}

#Preview {
    IntroScreen()
}
