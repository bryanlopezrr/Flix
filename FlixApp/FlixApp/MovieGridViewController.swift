//
//  MovieGridViewController.swift
//  FlixApp
//
//  Created by Bryan Lopez on 10/25/19.
//  Copyright © 2019 Bryan Lopez CP. All rights reserved.
//

import UIKit

class MovieGridViewController: UIViewController {

    var movies = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()


        
        // Do any additional setup after loading the view.
    
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
            
            // TODO: Get the array of movies
            // TODO: Store the movies in a property to use elsewhere
            // TODO: Reload your table view data
            
           }
        }
        task.resume()
        
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
