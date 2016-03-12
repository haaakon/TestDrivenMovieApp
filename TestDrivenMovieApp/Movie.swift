//
//  Movie.swift
//  TestDrivenMovieApp
//
//  Created by Håkon Bogen on 12/03/16.
//  Copyright © 2016 hakonbogen. All rights reserved.
//

import Foundation
import CoreData


class Movie: NSManagedObject {

    static let entityName = "Movie"

    struct Constants {

        static let movieID = "movieID"
        static let name = "name"

        static let movies = "movies"

    }

    class func movie(fromAttributes attributes: [String : AnyObject], inMangagedObjectContext managedObjectContext: NSManagedObjectContext) -> Movie? {

        guard let actualMovieID = attributes[Constants.movieID] as? NSNumber else {
            return nil
        }

        let movie = Movie(entity: NSEntityDescription.entityForName(entityName, inManagedObjectContext: managedObjectContext)!, insertIntoManagedObjectContext: managedObjectContext)

        movie.movieID = actualMovieID
        movie.name = attributes["name"] as? String

        return movie

    }

    class func movies(fromAttributes attributes: [String : AnyObject], inMangagedObjectContext managedObjectContext: NSManagedObjectContext) -> [Movie] {

        guard let actualMovies = attributes[Constants.movies] as? [[String : AnyObject]] else {
            return [Movie]()
        }

        var movies = [Movie]()

        for movieAttributes in actualMovies {
            if let movie = Movie.movie(fromAttributes: movieAttributes, inMangagedObjectContext: managedObjectContext) {
                movies.append(movie)
            }
        }

        return movies
    }

    class func allMovies(managedObjectContext : NSManagedObjectContext) -> [Movie] {
        let fetchRequest = NSFetchRequest(entityName: entityName)

        do {

            if let results = try managedObjectContext.executeFetchRequest(fetchRequest) as? [Movie] {
                return results
            }

        } catch {

            return [Movie]()

        }

        return [Movie]()
    }

}

