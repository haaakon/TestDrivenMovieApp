//
//  TestDrivenMovieAppTests.swift
//  TestDrivenMovieAppTests
//
//  Created by Håkon Bogen on 12/03/16.
//  Copyright © 2016 hakonbogen. All rights reserved.
//

import XCTest
import CoreData

@testable import TestDrivenMovieApp

class MovieTests: XCTestCase {
    
    override func setUp() {
        super.setUp()


        for movie in Movie.allMovies(CoreDataManager.moc()) {
            CoreDataManager.sharedManager.managedObjectContext.deleteObject(movie)
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreateMovie() {

        let jsonAttributes = XCTestCase.jsonAttributes(fromFileNamed: "Movie")

        let movie = Movie.movie(fromAttributes: jsonAttributes, inMangagedObjectContext: CoreDataManager.moc())

        XCTAssertNotNil(movie)
        XCTAssertEqual(movie?.name, "The Matrix")
        XCTAssertEqual(movie?.movieID, 34)

        let allMovies = Movie.allMovies(CoreDataManager.moc())
        XCTAssertEqual(allMovies.count, 1)

    }

    func testCreate2Movies() {

        let jsonAttributes = XCTestCase.jsonAttributes(fromFileNamed: "TwoMovies")

        let movies = Movie.movies(fromAttributes: jsonAttributes, inMangagedObjectContext: CoreDataManager.moc())
        XCTAssertEqual(movies.count, 2)

        let allMovies = Movie.allMovies(CoreDataManager.moc())

        XCTAssertEqual(allMovies.count, 2)

    }

}
