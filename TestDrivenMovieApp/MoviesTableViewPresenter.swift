//
//  MoviesTableViewPresenter.swift
//  TestDrivenMovieApp
//
//  Created by Håkon Bogen on 12/03/16.
//  Copyright © 2016 hakonbogen. All rights reserved.
//

import UIKit

class MoviesTableViewPresenter: NSObject, UITableViewDataSource {

    let movies = Movie.allMovies(CoreDataManager.moc())

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return movies.count

    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        return cell
    }
}
