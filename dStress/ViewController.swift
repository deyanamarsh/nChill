//
//  ViewController.swift
//  dStress
//
//  Created by Darcy Meyer on 3/29/16.
//  Copyright © 2016 Darcy Meyer. All rights reserved.
//

import UIKit
import EFCircularSlider
import Firebase
//import Firebase
//import EFCircularSlider.m

class ViewController: UIViewController, UITextFieldDelegate,UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    
    
    
    
    @IBOutlet var toSettings: UIImageView!
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var Bamboo: UIImageView?
    @IBOutlet weak var startButton: UIButton?
    
    var numLabelContent: Int?
    
    
    var myRootRef = Firebase(url: "https://nchill.firebaseio.com")
    
    
    
        

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.\
        
        let howToStart = UITapGestureRecognizer(target: self, action: "begin:")
        
        if let button = startButton {
            button.addGestureRecognizer(howToStart)
        }
        
        numLabelContent = 0
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        if let background = Bamboo {
            background.frame = CGRect(x: 0.75*screenWidth, y: 0, width: 100, height: 0.25*screenHeight)
        }
        
        let tapGear = UITapGestureRecognizer(target:self, action: Selector("changeToSettings:"))

        
        toSettings.userInteractionEnabled = true
        toSettings.addGestureRecognizer(tapGear)
        
        
        
        let sliderFrame: CGRect = CGRectMake(screenWidth/6, screenHeight/4, 2*screenWidth/3, 2*screenWidth/3)
        let moodSlider: EFCircularSlider = EFCircularSlider(frame: sliderFrame)
        
        let sliderBubbleOrange: UIColor = UIColor(red: 243/255, green: 156/255, blue: 18/255, alpha: 1)
        let sliderOrange: UIColor = UIColor(red: 250/255, green: 156/255, blue: 18/255, alpha: 1)
        let DarkGrey: UIColor = UIColor(red: 131/255, green: 131/255, blue: 131/255, alpha: 1)
        let LightGreen: UIColor = UIColor(red: 198/255, green: 209/255, blue: 127/255, alpha: 1)
        let DarkGreen: UIColor = UIColor(red: 104/255, green: 126/255, blue: 62/255, alpha: 1)
        

        
        moodSlider.filledColor = LightGreen
        // MAKE IT CHANGE COLORS!!!
        moodSlider.unfilledColor = UIColor(red: 41/255, green: 128/255, blue: 185/255, alpha: 1)
        moodSlider.handleColor = DarkGreen //DarkGrey
        moodSlider.handleType = bigCircle
        moodSlider.lineWidth = 10;
        moodSlider.maximumValue = 10.0;
        moodSlider.minimumValue = 0.0;
        moodSlider.addTarget(self, action: "dialChanged:", forControlEvents: .TouchDragInside)
        

        numLabel.text = "0"
        numLabel.textColor = DarkGreen
        numLabel.center = CGPointMake(screenWidth*0.5, 5)
        //screenHeight/4 + screenWidth/3
        
        self.view.addSubview(moodSlider)
        
        
        
        
        
    }
    

    
    // for text field delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(textField: UITextField) {
    }
    
    
//    func changetomenu(sender: UISwipeGestureRecognizer)
//    {
//        if (sender.direction == .Up)
//        {
//            print("asdf")
//            let controller2 =
//            self.storyboard?.instantiateViewControllerWithIdentifier("MenuViewController") as! MenuViewController
//            presentViewController(controller2, animated: true, completion: nil)
//            
//        }
//    }
    
    func changeToSettings(sender: UITapGestureRecognizer)
    {
        //print("aaa")
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("SettingsViewController") as! SettingsViewController
        presentViewController(controller, animated: false, completion: nil)
    }
    
    
    func dialChanged(sender: EFCircularSlider)
    {
        numLabel.text = "\(Int(sender.currentValue))"
        numLabelContent = Int(sender.currentValue)
    }
    
    
    func begin(sender: UIImageView)
    {
        
        if (Int(numLabel.text!)! <= 5) {
        let controller2 = self.storyboard?.instantiateViewControllerWithIdentifier("ChooseActionViewController") as! ChooseActionViewController
        presentViewController(controller2, animated: true, completion: nil)
        }
        else
        {
            let controller3 = self.storyboard?.instantiateViewControllerWithIdentifier("FeelingGoodViewController") as! FeelingGoodViewController
            presentViewController(controller3, animated: true, completion: nil)
            
            
        }
    }
    
    
    


}

