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
            List {
                NavigationLink {
                    SearchDetailView()
                } label: {
                    HStack {
                        Image(systemName: "house")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        
                        Text("Movie Title")
                        
                        Spacer()
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }

                }

            }
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
