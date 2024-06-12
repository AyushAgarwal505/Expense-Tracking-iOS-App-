//
//  Search.swift
//  TrackIt
//
//  Created by Ayush Agarwal on 10/06/24.
//

import SwiftUI
import Combine
struct Search: View {
    @State private var searchText : String = ""
    @State private var filterText : String = ""
    let searchPublisher  = PassthroughSubject<String, Never>()
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical){
                LazyVStack(spacing:15){
                    
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Search")
            .onChange(of: searchText, {
                oldValue, newValue in 
                if newValue.isEmpty{
                    filterText = ""
                }
                searchPublisher.send(newValue)
            })
            .onReceive(searchPublisher.debounce(for: .seconds(0.3), scheduler: DispatchQueue.main), perform: { text in
                filterText = text
                print(text)
            })
            .overlay(content: {
                ContentUnavailableView("Search Transactions", systemImage: "magnifyingglass")
                    .opacity(searchText.isEmpty ? 1 : 0)
            })
        }
    }
}

#Preview {
    Search()
}
