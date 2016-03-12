//
//  MovieDetailTableViewPresenter.swift
//  TestDrivenMovieApp
//
//  Created by Håkon Bogen on 12/03/16.
//  Copyright © 2016 hakonbogen. All rights reserved.
//

import XCTest

class MovieDetailTableViewPresenterTests: BaseTestCase {


    func testShowData() {

        let jsonAttributes = XCTestCase.jsonAttributes(fromFileNamed: "TwoMovies")
        Movie.movies(fromAttributes: jsonAttributes, inMangagedObjectContext: CoreDataManager.moc())
        let movieDetailTableViewPresenter = MovieDetailTableViewPresenter(movieID: 33)

        let movie = Movie.fetchMovie(withMovieID: 33, managedObjectContext: CoreDataManager.moc())
        XCTAssertNotNil(movie)

        let titleAndText = movieDetailTableViewPresenter.titleAndTextForIndexPath(NSIndexPath(forRow: 0, inSection: 0))

        XCTAssertNotNil(titleAndText)

        XCTAssertEqual(movie?.name, titleAndText?.1)

        let IMDBScoreAndTitle = movieDetailTableViewPresenter.titleAndTextForIndexPath(NSIndexPath(forRow: 1, inSection: 0))

        XCTAssertEqual(movie?.imdbScore?.stringValue, IMDBScoreAndTitle?.1)
    }

}
