//
//  ChangeNameViewController.swift
//  dStress
//
//  Created by Darcy Meyer on 4/17/16.
//  Copyright © 2016 Darcy Meyer. All rights reserved.
//

import Foundation
import UIKit

protocol DataEnteredDelegate: class {
    func userDidEnterInformation(info: String)
}

class ChangeNameViewController: UIViewController, UITextFieldDelegate {
    weak var delegate: DataEnteredDelegate? = nil
    
    @IBOutlet weak var typedName: UITextField!
    var name: String!
    
    override func viewDidLoad() {
        typedName.delegate = self
        let defaults = NSUserDefaults.standardUserDefaults()
        if let name = defaults.objectForKey("name") as! String! {
            typedName.text = name
        }
    }
    
    @IBAction func changedName() {
        print("test")
        delegate?.userDidEnterInformation(typedName.text!)
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(typedName.text!, forKey: "name")
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard
        name = typedName.text
        textField.resignFirstResponder()
        changedName()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        //SettingsViewController().nameLabel.text = textField.text
        name = textField.text
    }
    
    
}