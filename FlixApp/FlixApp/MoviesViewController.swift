//
//  MoviesViewController.swift
//  FlixApp
//
//  Created by Bryan Lopez on 10/18/19.
//  Copyright © 2019 Bryan Lopez CP. All rights reserved.
//

/* Mobile application pulling data from a tumblr API. */

import UIKit
import AlamofireImage

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    //variable in map format to store individual movies at a time
    var movies = [[String:Any]]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        //                            |||
        //NETWORK REQUEST CODE SNIPET vvv   ------
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        //                                  -----

        /*print(dataDictionary) console print to check the API loaded properly*/
            //dataDictionary storing the JSON format API to search and use
            self.movies = dataDictionary["results"] as! [[String:Any]]
                  
            //Reload the tableview bc when opening the app, there is not enough time to make the network
            //request and get the data back
            self.tableView.reloadData()
            
            // TODO: Get the array of movies
            // TODO: Store the movies in a property to use elsewhere
            // TODO: Reload your table view data
            
           }
        }
        task.resume()
        
        
    }
    
    
    /*
     Table View Recipe:
        1. Add 'UITableViewDataSource, UITableViewDelegate' to the class header (click on error to fix)
        2. Implement the required functions when clicking fix below vv
        3. tableView.dataSource = self , tableView.delegate = self
     */
    
    //function asking for number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count //will increase every time, printing one movie per iterarion
    }
    
    //function that asks for each particular row, give me the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cell pertains to the frame inside the ViewController, the dequeue function helps with memory
        //allocation to not overload RAM at a specific time (dynamic programming)
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieViewCell
        
        //Movie stores the particular movie, title gets the casted string title, and overview stores the synopsis
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let overview = movie["overview"] as! String
        
        cell.titleLabel.text = title
        cell.synopsisLabel.text = overview
        
        //Cocoapods part of the application to have the baseURL and append the path of each image to download it to th app
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterURL = URL(string: baseURL + posterPath)
        
        cell.posterView.af_setImage(withURL: posterURL!)
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
