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
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreateMovie() {

        let path = NSBundle(forClass: MovieTests.self).pathForResource("Movie", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        let jsonAttributes = try! NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! [String : AnyObject]
        

        let movie = Movie.movie(fromAttributes: jsonAttributes, inMangagedObjectContext: CoreDataManager.moc())

        XCTAssertNotNil(data)

        XCTAssertNotNil(movie)


    }
    

}
