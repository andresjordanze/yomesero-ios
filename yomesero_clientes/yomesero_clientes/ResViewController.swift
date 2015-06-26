//
//  ResViewController.swift
//  yomesero_clientes
//
//  Created by internet on 6/26/15.
//  Copyright (c) 2015 internet. All rights reserved.
//

import UIKit

class ResViewController: UIViewController, UITableViewDataSource{
    
    var restaurants = [ResModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apiURL = NSURL(string: "https://frozen-springs-8168.herokuapp.com/restaurants.json")
        
        if let JSONData = NSData(contentsOfURL: apiURL!) {
            if let json = NSJSONSerialization.JSONObjectWithData(JSONData, options: nil, error: nil) as? NSArray {
                
                for restaurant in json {
                    restaurants.append(ResModel(json: restaurant as NSDictionary))
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let name = restaurants[indexPath.row].restaurant_name
        let address = restaurants[indexPath.row].restaurant_address
        let phone = restaurants[indexPath.row].restaurant_phone

        var cellRes = tableView.dequeueReusableCellWithIdentifier("CellRes", forIndexPath: indexPath) as UITableViewCell
        cellRes.textLabel?.text = name
        cellRes.detailTextLabel?.text = "Direccion: "+address!+" "+phone!
        return cellRes
    }
}
