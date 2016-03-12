//
//  BaseTestCase.swift
//  TestDrivenMovieApp
//
//  Created by Håkon Bogen on 12/03/16.
//  Copyright © 2016 hakonbogen. All rights reserved.
//

import XCTest

class BaseTestCase: XCTestCase {
    
    override func setUp() {
        super.setUp()

        for movie in Movie.allMovies(CoreDataManager.moc()) {
            
            CoreDataManager.sharedManager.managedObjectContext.deleteObject(movie)

        }
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

}
