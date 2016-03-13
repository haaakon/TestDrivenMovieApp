# TestDrivenMovieApp
Showcasing iOS test driven development

This project is part of a presentation about test driven iOS devlopement. The slides from the talk are below:

#Test driven iOS development

#### Håkon Bogen iOS developer at Beining & Bogen

---

# Test driven iOS development


- Definition: usually write failing tests first
- in iOS its not that strict
- when you are working on a feature, think about how testing it can be automated
- mindset should be all new features should have their own unit tests

---

# Pros

- Makes your code better and separated ( not huge VCs )
- Easier to do development with running tests instead of clicking around in simulator
- Can spot bugs - "its just a small change, won't matter"
- Gives you a bit more peace of mind 
- Tests are documentation


---

# Cons

- Takes time
- Takes effort
- Alot of stuff in apps can't be tested by XCTests
- Not really that much used in iOS as other platforms


---
# Lets look at some examples

https://github.com/haaakon/TestDrivenMovieApp

```Swift

GET movie - Movie.json

{
    "movieID": 34,
    "name": "The Matrix",
    "imdbScore" : 8.8
}


```

--- 


```Swift

   func testCreateMovie() {

        let jsonAttributes = XCTestCase.jsonAttributes(fromFileNamed: "Movie")

        let movie = Movie.movie(fromAttributes: jsonAttributes, inMangagedObjectContext: CoreDataManager.moc())

        XCTAssertNotNil(movie)
        XCTAssertEqual(movie?.name, "The Matrix")
        XCTAssertEqual(movie?.movieID, 34)
        XCTAssertEqual(movie?.imdbScore, 8.8)

        let allMovies = Movie.allMovies(CoreDataManager.moc())
        XCTAssertEqual(allMovies.count, 1)

    }
    

```


---

#Looks good, but is it worth the effort?


- "Will never fail"
- Loads of work for almost no gain
- Tests are worthless at first

---
# 4 Months later

    "movieID": 34,
    "name": "The Matrix",
    "imdbScore": 8.8,
    "actors": [344, 2242, 4343],
    "genres": [49939, 42312, 234, 1, 23],
    "hasOscars": null,
    "director": "",
    "boxOffice": "$493.199.342",
    "trailerURL": "http://movietrailers.net/342992359235%20%20-thematrix.php.exe",
    "previewURL": "",
    "country" : "USA",
    "userReviews": 32429



---

```Swift

        XCTAssertEqual(movie?.name, "The Matrix")
        XCTAssertEqual(movie?.movieID, 34)
        XCTAssertEqual(movie?.imdbScore, 8.8)
        XCTAssertEqual(movie?.actors.count, 3)
        XCTAssertEqual(movie?.genres.count, 3)
        XCTAssertNil(movie?.director)
        XCTAssertEqual(movie?.boxOffice, 493199342)
        
 ```

---


### You don't want to tap around in the app to find bugs in bad json


---
# testing UITableView

```Swift

class MoviesTableViewPresenter: NSObject, UITableViewDataSource {

    var movies = Movie.allMovies(CoreDataManager.moc())
        
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return movies.count

    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        cell.textLabel?.text = movies[indexPath.row].name

        return cell
    }


    func movie(atIndexPath indexPath: NSIndexPath) -> Movie {

        return movies[indexPath.row]
        
    }
}


```


---

# Testing the presenter


```Swift

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

```

---
# Even more value when we have more complexity later

4 months later: 

```Swift

    func testShowSciFiGenreThenSwitchToDrama() {

        let jsonAttributes = XCTestCase.jsonAttributes(fromFileNamed: "MoviesV3")
        
        Movie.movie(fromAttributes: jsonAttributes, inMangagedObjectContext: CoreDataManager.moc())

        CoreDataManager.sharedManager.saveContext()

        let moviesTableViewPresenter = MoviesTableViewPresenter(genreID: 432)
        
        XCTAssertEqual(moviesTableViewPresenter.tableView(UITableView(), numberOfRowsInSection: 0), 2)
        
        XCTAssertEqual(moviesTableViewPresenter.tableView(UITableView(), numberOfRowsInSection: 1), 1)
        
        XCTAssertEqual(moviesTableViewPresenter.numberOfSectionsInTableView(UITableView()), 2)
       
  
        moviesTableViewPresenter.genreID = 490   // Core data observers
        
        XCTAssertEqual(moviesTableViewPresenter.tableView(UITableView(), numberOfRowsInSection: 0), 1)
        
        XCTAssertEqual(moviesTableViewPresenter.numberOfSectionsInTableView(UITableView()), 1)
        
```

---

# Lets look at the Xcode project


---

# Tips


- You can test alot with XCTests before sinking time into manual testing
- Split data sources from VC to presenters and test those instead
- When you have 80+ tests you really start to feel the value
- Tell the rest of the project when the tests found a bug so they know its worthwhile :)


---

