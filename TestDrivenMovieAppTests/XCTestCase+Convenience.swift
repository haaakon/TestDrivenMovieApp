//
//  XCTestCase+Convenience.swift
//  TestDrivenMovieApp
//
//  Created by Håkon Bogen on 12/03/16.
//  Copyright © 2016 hakonbogen. All rights reserved.
//

import Foundation
import XCTest

extension XCTestCase {

    class func jsonAttributes(fromFileNamed name: String) -> [String : AnyObject]{

        let path = NSBundle(forClass: MovieTests.self).pathForResource(name, ofType: "json")
        let data = NSData(contentsOfFile: path!)
        let jsonAttributes = try! NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! [String : AnyObject]

        return jsonAttributes
        
    }
}