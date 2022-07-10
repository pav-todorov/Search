//
//  SearchView.swift
//  Search
//
//  Created by Pavel on 8.07.22.
//

import SwiftUI
import Combine
import Shared_Models

// MARK: - Search View
public struct SearchView: View {
    // MARK: Properties
    @ObservedObject private var searchViewModel = SearchViewModel()
    
    @State var searchWord = ""
    private var movieSearch: [MovieResultEntity.Movie] {
        if searchWord.isEmpty {
            return []
        } else {
            searchViewModel.searchMovie(by: searchWord)
            return searchViewModel.searchMovieResult
        }
    }
    
    // MARK: Public Initializer
    public init() {}
    
    // MARK: Body
    public var body: some View {
        NavigationView {
            List(self.movieSearch, id: \.id) { movieModel in
                NavigationLink {
                    SearchDetailView()
                } label: {
                    HStack {
                        AsyncImage(url: URL(string: movieModel.posterPath ?? "")) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                            
                        
                        Text(movieModel.title)
                        
                        Spacer()
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    } //: HStack

                } //: NavigationLink

            } //: List
            .navigationTitle("Search")
        } //: NavigationView
        .searchable(text: $searchWord, prompt: "Search a movie by title")
    }
}

// MARK: Search View Previews
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
