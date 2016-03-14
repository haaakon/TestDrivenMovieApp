//
//  MovieDetailTableViewPresenter.swift
//  TestDrivenMovieApp
//
//  Created by Håkon Bogen on 12/03/16.
//  Copyright © 2016 hakonbogen. All rights reserved.
//

import UIKit

class MovieDetailTableViewPresenter: NSObject, UITableViewDataSource {

    var movie: Movie? {

        didSet {

        }

    }

    var movieID : NSNumber {

        didSet {
            movie = Movie.fetchMovie(withMovieID: movieID, managedObjectContext: CoreDataManager.moc())
        }

    }


    init(movieID: NSNumber) {

        self.movieID = movieID
        movie = Movie.fetchMovie(withMovieID: movieID, managedObjectContext: CoreDataManager.moc())

        super.init()

    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 2

    }

    func titleAndTextForIndexPath(indexPath: NSIndexPath) -> (String, String)? {

        switch indexPath.row {

        case 0:
            return ("name:", movie!.name!)

        case 1:
            return ("IMDB:", movie!.imdbScore!.stringValue)

        default:
            break

        }

        return nil
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {


        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        if let titleAndText = titleAndTextForIndexPath(indexPath) {
            cell.textLabel?.text = titleAndText.0
            cell.detailTextLabel?.text = titleAndText.1
        }

        return cell

    }



}
