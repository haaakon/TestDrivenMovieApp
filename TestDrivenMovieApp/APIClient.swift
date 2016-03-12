//
//  APIClient.swift
//  TestDrivenMovieApp
//
//  Created by Håkon Bogen on 12/03/16.
//  Copyright © 2016 hakonbogen. All rights reserved.
//

import UIKit

class APIClient: NSObject {


    // mock implementation

    class func getMovies(didComplete: (movies: [Movie]) -> () ) {

        let json = jsonAttributes(fromFileNamed: "TwoMovies")

        let movies = Movie.movies(fromAttributes: json, inMangagedObjectContext: CoreDataManager.moc())

        didComplete(movies: movies)

    }

    private class func jsonAttributes(fromFileNamed name: String) -> [String : AnyObject]{

        let path = NSBundle(forClass: APIClient.self).pathForResource(name, ofType: "json")
        let data = NSData(contentsOfFile: path!)
        let jsonAttributes = try! NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! [String : AnyObject]

        return jsonAttributes
        
    }
}
