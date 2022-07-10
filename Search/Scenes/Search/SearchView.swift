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
    @State private var cancellable: AnyCancellable?
    @State var movies: MovieResultEntity?
    
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
            .onAppear {
                self.cancellable = SearchMovieNetworkGeteway().fetch(with: .init(query: "minions"))
                    .catch{ error -> AnyPublisher<MovieResultEntity, Never> in
                        
                        print(error)
                        
                       return Just(MovieResultEntity())
                            .eraseToAnyPublisher()
                    }
                        .sink(receiveValue: { movie in
                            self.movies = movie
                            
                            print(movie)
                        })
                
                
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
