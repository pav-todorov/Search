//
//  SearchView.swift
//  Search
//
//  Created by Pavel on 8.07.22.
//

import SwiftUI

// MARK: - Search View
public struct SearchView: View {
    // MARK: Properties
    
    // MARK: Public Initializer
    public init() {}
    
    // MARK: Body
    public var body: some View {
        NavigationView {
            Text("Hello, World!")
        }
        .navigationTitle("Search")
    }
}

// MARK: Search View Previews
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
