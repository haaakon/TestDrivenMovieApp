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

    struct Constants {

        static let movieID = "movieID"
        static let name = "name"

    }

    class func movie(fromAttributes attributes: [String : AnyObject], inMangagedObjectContext managedObjectContext: NSManagedObjectContext) -> Movie? {

        guard let actualMovieID = attributes[Constants.movieID] as? NSNumber else {
            return nil
        }

        let movie = Movie(entity: NSEntityDescription.entityForName("Movie", inManagedObjectContext: managedObjectContext)!, insertIntoManagedObjectContext: managedObjectContext)

        movie.movieID = actualMovieID
        movie.name = attributes[Constants.name] as? String

        return movie

    }

}

