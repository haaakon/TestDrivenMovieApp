//
//  MoviesTableViewPresenter.swift
//  TestDrivenMovieApp
//
//  Created by Håkon Bogen on 12/03/16.
//  Copyright © 2016 hakonbogen. All rights reserved.
//

import UIKit

class MoviesTableViewPresenter: NSObject, UITableViewDataSource {

    var movies = Movie.allMovies(CoreDataManager.moc())
        
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return movies.count

    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        cell.textLabel?.text = movies[indexPath.row].name

        return cell
    }


    func movie(atIndexPath indexPath: NSIndexPath) -> Movie {

        return movies[indexPath.row]
        
    }
}
