//
//  MovieDetailTableViewPresenter.swift
//  TestDrivenMovieApp
//
//  Created by Håkon Bogen on 12/03/16.
//  Copyright © 2016 hakonbogen. All rights reserved.
//

import XCTest

class MovieDetailTableViewPresenterTests: BaseTestCase {


    func testShowDataForMovie() {

        let jsonAttributes = BaseTestCase.jsonAttributes(fromFileNamed: "TwoMovies")

        Movie.movies(fromAttributes: jsonAttributes, inMangagedObjectContext: CoreDataManager.moc())

        let movie = Movie.fetchMovie(withMovieID: 33, managedObjectContext: CoreDataManager.moc())

        let movieDetailTableViewPresenter = MovieDetailTableViewPresenter(movieID: movie!.movieID)

        let titleAndText = movieDetailTableViewPresenter.titleAndTextForIndexPath(NSIndexPath(forRow: 0, inSection: 0))

        XCTAssertEqual(titleAndText?.1, movie?.name)

        let titleAndText2 = movieDetailTableViewPresenter.titleAndTextForIndexPath(NSIndexPath(forRow: 1, inSection: 0))

        XCTAssertEqual(titleAndText2?.1, "8.8")




    }

}
