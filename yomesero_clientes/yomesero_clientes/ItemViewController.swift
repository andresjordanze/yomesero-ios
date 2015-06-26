//
//  ItemViewController.swift
//  yomesero_clientes
//
//  Created by internet on 6/26/15.
//  Copyright (c) 2015 internet. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController, UITableViewDataSource{
    
    var items = [ItemModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apiURL = NSURL(string: "https://frozen-springs-8168.herokuapp.com/items.json")
        
        if let JSONData = NSData(contentsOfURL: apiURL!) {
            if let json = NSJSONSerialization.JSONObjectWithData(JSONData, options: nil, error: nil) as? NSArray {
                for item in json {
                    items.append(ItemModel(json: item as NSDictionary))
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let name = items[indexPath.row].item_name
        let type = items[indexPath.row].item_type
        let price = " Bs. "+NSString(format: "%.2f", items[indexPath.row].item_price!)
        
        if type == "Comida" {
            var cellFood = tableView.dequeueReusableCellWithIdentifier("CellFood", forIndexPath: indexPath) as UITableViewCell
            cellFood.textLabel?.text = name
            cellFood.detailTextLabel?.text = "Tipo: "+type!+price
            return cellFood
        }
        if type == "Bebida" {
            var cellDrink = tableView.dequeueReusableCellWithIdentifier("CellDrink", forIndexPath: indexPath) as UITableViewCell
            cellDrink.textLabel?.text = name
            cellDrink.detailTextLabel?.text = "Tipo: "+type!+price
            
            return cellDrink
        }else {
            var cellDessert = tableView.dequeueReusableCellWithIdentifier("CellDessert", forIndexPath: indexPath) as UITableViewCell
            cellDessert.textLabel?.text = name
            cellDessert.detailTextLabel?.text = "Tipo: "+type!+price
            return cellDessert
        }
    }
}
