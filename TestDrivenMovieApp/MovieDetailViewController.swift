//
//  DetailViewController.swift
//  TestDrivenMovieApp
//
//  Created by Håkon Bogen on 12/03/16.
//  Copyright © 2016 hakonbogen. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {


    @IBOutlet weak var tableView : UITableView!

    var movieID : NSNumber!

    var movieDetailTableViewPresenter : MovieDetailTableViewPresenter!

    override func viewDidLoad() {
        
        super.viewDidLoad()

        movieDetailTableViewPresenter = MovieDetailTableViewPresenter(movieID: movieID)
        tableView.dataSource = movieDetailTableViewPresenter

    }

    

}
