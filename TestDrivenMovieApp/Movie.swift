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

