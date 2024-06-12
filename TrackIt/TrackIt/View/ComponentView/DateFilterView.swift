//
//  DateFilterView.swift
//  TrackIt
//
//  Created by Ayush Agarwal on 11/06/24.
//

import SwiftUI

struct DateFilterView: View {
    @State var start: Date
    @State var end: Date
    
    var onSubmit: (Date, Date) -> ()
    var onClose : () -> ()
    
    var body: some View{
        VStack(spacing:15){
            DatePicker("Start Date", selection: $start, displayedComponents: [.date])
            DatePicker("End Date", selection: $end, displayedComponents: [.date])
            
            HStack(spacing:5){
                Button("Cancel"){onClose()}
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle(radius: 5))
                    .tint(.red)
                
                Button("Filter"){onSubmit(start,end)}
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle(radius: 5))
                    .tint(.green)
            }
            .padding(.top,10)
            
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 20)
        .background(.bar, in: .rect(cornerRadius: 10))
        
    }
}


