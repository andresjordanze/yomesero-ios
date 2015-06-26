//
//  NewItemViewController.swift
//  YoMesero-Restaurants
//
//  Created by internet on 6/26/15.
//  Copyright (c) 2015 internet. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController, UIPickerViewDelegate, UITextFieldDelegate{
    var type = ["Comida", "Bebida", "Postre"]
    @IBOutlet weak var pickerType: UIPickerView! = UIPickerView()
    @IBOutlet weak var testFieldType: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var descriptionText: UITextField!
    @IBOutlet weak var timeText: UITextField!
    @IBOutlet weak var priceText: UITextField!
    
    override func viewDidLoad() {
        pickerType.delegate = self
        super.viewDidLoad()
        testFieldType.text = type[0]
    }
    @IBAction func buttonPressed(sender: AnyObject) {
        var url = "https://frozen-springs-8168.herokuapp.com/create_from_json?"
        url = url + "item_name=" + nameText.text
        url = url + "&item_description=" + descriptionText.text
        url = url + "&item_type=" + testFieldType.text
        url = url + "&item_time=" + timeText.text
        url = url + "&item_price=" + priceText.text
        url = url.stringByReplacingOccurrencesOfString(" ", withString: "%20")
        let addItemURL = NSURL(string: url)
        if let query = NSData(contentsOfURL: addItemURL!) {
            println("Enviado")
        }
        else{
            println("Error")
        }
        
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int{
        return 1
    }

    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int{
        return type.count
    }

    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String! {
        return type[row]
    }

    func pickerView(pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int) {
        testFieldType.text = type[row]
    }

    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        pickerType.hidden = false
        return false
    }
}