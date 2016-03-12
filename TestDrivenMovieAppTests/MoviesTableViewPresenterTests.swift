//
//  MoviesTableViewPresenterTests.swift
//  TestDrivenMovieApp
//
//  Created by Håkon Bogen on 12/03/16.
//  Copyright © 2016 hakonbogen. All rights reserved.
//

import XCTest

class MoviesTableViewPresenterTests: BaseTestCase {


    func testShow0Movies() {

        let moviesTableViewPresenter = MoviesTableViewPresenter()

        XCTAssertEqual(moviesTableViewPresenter.tableView(UITableView(), numberOfRowsInSection: 0), 0)

    }

    func testShow1Movie() {

        let jsonAttributes = XCTestCase.jsonAttributes(fromFileNamed: "Movie")

        Movie.movie(fromAttributes: jsonAttributes, inMangagedObjectContext: CoreDataManager.moc())

        CoreDataManager.sharedManager.saveContext()

        let moviesTableViewPresenter = MoviesTableViewPresenter()

        XCTAssertEqual(moviesTableViewPresenter.tableView(UITableView(), numberOfRowsInSection: 0), 1)

    }

    func testShow2Movies() {

        let jsonAttributes = XCTestCase.jsonAttributes(fromFileNamed: "TwoMovies")

        Movie.movies(fromAttributes: jsonAttributes, inMangagedObjectContext: CoreDataManager.moc())

        CoreDataManager.sharedManager.saveContext()

        let moviesTableViewPresenter = MoviesTableViewPresenter()

        XCTAssertEqual(moviesTableViewPresenter.tableView(UITableView(), numberOfRowsInSection: 0), 2)


    }

}
