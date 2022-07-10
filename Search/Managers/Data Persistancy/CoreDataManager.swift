//
//  CoreDataManager.swift
//  Search
//
//  Created by Pavel on 10.07.22.
//

import Foundation
import CoreData

// MARK: - Core Data Manager
class CoreDataManager {
    // MARK: Properties
    let persistentContainer: NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    // MARK: Initializers
    private init() {
        persistentContainer = NSPersistentCloudKitContainer(name: "Movies")
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data Store failed \(error)")
            }
        }
        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
        persistentContainer.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }
    
    func saveMovie(movie: MovieResultEntity.Movie) {
        let movie = Movie(context: persistentContainer.viewContext)
        movie.id = movie.id
        movie.title = movie.title
        movie.originalTitle = movie.originalTitle
        movie.posterPath = movie.posterPath
        movie.releaseDate = movie.releaseDate
        movie.overview = movie.overview
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to safe movie to database \(error)")
        }
    }
    
    func deleteFavoriteMovie(movie: Movie) {
        persistentContainer.viewContext.delete(movie)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save context \(error)")
        }
    }
    
}
