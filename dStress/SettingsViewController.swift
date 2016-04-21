//
//  SettingsViewController.swift
//  dStress
//
//  Created by Darcy Meyer on 4/4/16.
//  Copyright © 2016 Darcy Meyer. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController, UINavigationControllerDelegate, UIGestureRecognizerDelegate, DataEnteredDelegate {
    @IBOutlet weak var nameLabel: UILabel!
    
    //var nameLabelVar: String!
    
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        if let name = defaults.objectForKey("name") as! String! {
            nameLabel.text = name
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "changeName" {
//            let secondViewController = segue.destinationViewController as! ChangeNameViewController
//            secondViewController.delegate = self
//        }
    }
    
    func userDidEnterInformation(info: String) {
        nameLabel.text = info
    }
}
