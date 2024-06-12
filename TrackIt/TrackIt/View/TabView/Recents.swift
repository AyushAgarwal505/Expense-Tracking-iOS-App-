//
//  Recents.swift
//  TrackIt
//
//  Created by Ayush Agarwal on 10/06/24.
//

import SwiftUI
import SwiftData

struct Recents: View {
    @State var startDate: Date = .now.startOfMonth
    @State var endDate: Date = .now.endOfMonth
    @State var selectedCategory: Category = .expense
    @State var showFilterView: Bool = false
    
    @Namespace private var animation
    @Query(sort: [SortDescriptor(\Transaction.dateAdded, order:.reverse)], animation: .snappy)private var transactions:[Transaction]
    var body: some View {
        NavigationStack{
            ScrollView(.vertical){
                LazyVStack(spacing:10,pinnedViews: [.sectionHeaders]){
                    Section {
                        Button(action: {
                            showFilterView = true
                            
                        },label: {
                            Text("\(format(date: startDate, format: "dd MMM yy")) to \(format(date: endDate, format: "dd MMM yy"))")
                                .font(.callout)
                                .foregroundStyle(.gray)
                            
                        })
                        .hSpacing(alignment: .leading)
                        //Card View
                        CardView(income: 10000, expense: 500)
                            .padding(.bottom, 8)
                        //Custom Segmented Control
                        CustomSegmentedControl()
                            .padding(.bottom, 7)
                        ForEach(transactions.filter({$0.category == selectedCategory.rawValue})){
                            transaction in NavigationLink(value:transaction){
                                TransactionCardView(transaction: transaction)
                            }
                        }
        
                    } header: {
                        HeaderView()
                    }
                }
                .padding(15)
            }
            .background(.gray.opacity(0.15))
            .blur(radius: showFilterView ? 5 : 0)
            .navigationDestination(for: Transaction.self){
                transaction in ExpenseView(editTransaction: transaction)
            }
        }
        .overlay{
            ZStack{
                if showFilterView{
                    DateFilterView(
                        start: startDate,
                        end: endDate,
                        onSubmit: { start,end in 
                            startDate = start
                            endDate = end
                            showFilterView = false } ,
                        onClose: { showFilterView = false }
                    )
                        .transition(.move(edge:.leading))
                }
            }
            .animation(.snappy, value:showFilterView)
        }
    }
    @ViewBuilder
    func HeaderView() -> some View{
        HStack{
            VStack(alignment: .leading, spacing:5){
                Text("Welcome")
                    .font(.title.bold())    
                Text("Ayush Agarwal")
                    .font(.callout)
                    .foregroundStyle(.gray)
                
            }
            Spacer()
            NavigationLink{
                ExpenseView()
            } label:{
                Image(systemName: "plus")
                    .font(.title3)
                    .fontWeight (.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 45, height: 45)
                    .background(.blue, in: .circle)
            }
        }
        .hSpacing(alignment: .leading)
    }
    @ViewBuilder
    func CustomSegmentedControl()->some View{
        HStack{
            ForEach(Category.allCases, id:\.rawValue){category in
                Text(category.rawValue)
                    .hSpacing()
                    .padding(.vertical,10)
                    .background{
                        if category == selectedCategory{
                            Capsule()
                                .fill(.background)
                                .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                        }
                    }
                    .contentShape(.capsule)
                    .onTapGesture {
                        withAnimation(.snappy){
                            selectedCategory = category
                        }
                    }
            }
        }
        .background(.gray.opacity(0.15), in: .capsule)
    }
}

#Preview {
    Recents()
}
