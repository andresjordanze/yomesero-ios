//
//  ItemModel.swift
//  YoMesero-Restaurants
//
//  Created by internet on 6/26/15.
//  Copyright (c) 2015 internet. All rights reserved.
//

import Foundation

class ItemModel {
    var item_name: String?
    var item_price: Float?
    var item_type: String?
    
    init(json: NSDictionary) {
        self.item_name = json["item_name"] as? String
        self.item_price = json["item_price"] as? Float
        self.item_type = json["item_type"] as? String
    }
}
