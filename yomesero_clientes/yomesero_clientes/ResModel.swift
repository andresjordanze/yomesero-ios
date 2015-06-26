//
//  ResModel.swift
//  yomesero_clientes
//
//  Created by internet on 6/26/15.
//  Copyright (c) 2015 internet. All rights reserved.
//

import UIKit

class ResModel {
    var restaurant_name: String?
    var restaurant_address: String?
    var restaurant_phone: String?
    
    init(json: NSDictionary) {
        self.restaurant_name = json["restaurant_name"] as? String
        self.restaurant_address = json["restaurant_address"] as? String
        self.restaurant_phone = json["restaurant_phone"] as? String
    }
}