//
//  SearchDetailView.swift
//  Search
//
//  Created by Pavel on 9.07.22.
//

import SwiftUI

// MARK: Search Detail View
struct SearchDetailView: View {
    var body: some View {
        ScrollView {
            Image(systemName: "house")
            
            Spacer()
            
            Text("Movie Description")
        }
    }
}

struct SearchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SearchDetailView()
    }
}
