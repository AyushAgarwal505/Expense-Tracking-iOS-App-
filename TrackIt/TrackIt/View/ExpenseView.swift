//
//  ExpenseView.swift
//  TrackIt
//
//  Created by Ayush Agarwal on 11/06/24.
//

import SwiftUI

struct ExpenseView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    @State var editTransaction : Transaction?
    @State private var title : String = ""
    @State private var remarks : String = ""
    @State private var amount : Double = .zero
    @State private var dateAdded : Date = .now
    @State private var category : Category = .expense
    @State var tint : TintColor = tints.randomElement()!
    var body: some View {
        ScrollView(.vertical){
            VStack(spacing : 15){
                Text("Preview")
                    .font(.caption)
                    .foregroundStyle(.gray)
                TransactionCardView(transaction: 
                        .init(title: title.isEmpty ? "title": title, 
                              remarks: remarks.isEmpty ? "Remarks":remarks,
                              amount: amount, 
                              dateAdded: dateAdded,
                              category: category,
                              tintColor: tint))
                CustomSection(title: "Title", hint:"Mobile Phone", value: $title)
                CustomSection(title: "Remarks", hint: "Garbage", value: $remarks)
                VStack(alignment: .leading, content: {
                    Text("Amount and Category")
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .hSpacing(alignment: .leading)
                    HStack(spacing:15){
                        TextField("0.0", value : $amount, formatter: numberFormatter)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 12)
                            .background(.background, in:.rect(cornerRadius: 10))
                            .frame(maxWidth: 130)
                            .keyboardType(.decimalPad)
                        //Custom Check Box
                        CategoryCheckBox()
                        
                    }
                })
                VStack(alignment: .leading, content: {
                    Text("Date")
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .hSpacing(alignment: .leading)
                    
                    DatePicker("", selection: $dateAdded, displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 12)
                        .background(.background, in:.rect(cornerRadius: 10))
                })
            }
            .padding(15)
        }
        .navigationTitle("Add a Transaction")
        .background(.gray.opacity(0.15))
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing){
                Button("Save", action: save)
            }
        })
        .onAppear(perform:{
            if let editTransaction{
                //Load all Data
                title = editTransaction.title
                remarks = editTransaction.remarks
                dateAdded = editTransaction.dateAdded
                if let category = editTransaction.rawCategory{
                    self.category = category
                }
                amount = editTransaction.amount
                if let tint = editTransaction.tint{
                    self.tint = tint
                }
            }
        })
    }
    func save(){
        if editTransaction != nil{
            editTransaction?.title = title
            editTransaction?.remarks = remarks
            editTransaction?.dateAdded = dateAdded
            editTransaction?.amount = amount
            editTransaction?.category = category.rawValue
        } else{
            let transaction = Transaction(title: title, remarks: remarks, amount: amount, dateAdded: dateAdded, category: category, tintColor: tint)
            context.insert(transaction)
        }
        dismiss()
    }
    
    @ViewBuilder
    func CustomSection(title : String, hint:String, value : Binding<String>) -> some View{
        VStack(alignment : .leading, spacing:10, content:{
            Text(title)
                .font(.caption)
                .foregroundStyle(.gray).hSpacing(alignment: .leading)
            TextField(hint, text : value)
                .padding(.horizontal, 15)
                .padding(.vertical, 12)
                .background(.background, in:.rect(cornerRadius: 10))
            
        })
    }
    @ViewBuilder
    func CategoryCheckBox() -> some View {
        HStack(spacing:10){
            ForEach(Category.allCases, id: \.rawValue){
                category in HStack(spacing:5){
                    ZStack{
                        Image(systemName: "circle")
                            .font(.title3)
                            .foregroundStyle(.blue)
                        if self.category == category {
                            Image(systemName: "circle.fill")
                                .font(.caption)
                                .foregroundStyle(.blue)
                        }
                    }
                    Text(category.rawValue)
                        .font(.caption)
                }
                .contentShape(.rect)
                .onTapGesture{
                    self.category = category
                }
            }
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 15)
        .hSpacing(alignment: .leading)
        .background(.background, in: .rect(cornerRadius: 10))
    }
    
    var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        
        return formatter
    }
}


#Preview {
    NavigationStack{
        ExpenseView()
    }
}
