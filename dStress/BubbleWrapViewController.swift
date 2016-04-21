//
//  BubbleWrapViewController.swift
//  dStress
//
//  Created by Darcy Meyer on 4/11/16.
//  Copyright © 2016 Darcy Meyer. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox // for popping

class BubbleWrapViewController: UIViewController {
    
    var bubbleWrap: [BubbleImageView] = []

    var bubblesPopped = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let screenWidth = Int(UIScreen.mainScreen().bounds.size.width)
        let screenHeight = Int(UIScreen.mainScreen().bounds.size.height)
        
        let wrapBuffer = 10
        let bubbleBuffer = 5
        
        let baseWidth = screenWidth - 2*wrapBuffer
        let baseHeight = screenHeight - 2*wrapBuffer
        
        let rows = Int(baseWidth / (Int(BubbleImageView.size) + (bubbleBuffer*2)))
        let columns = Int(baseHeight / (Int(BubbleImageView.size) + (bubbleBuffer*2)))
        
        let wrapHeight = (columns-1)*(2*bubbleBuffer+Int(BubbleImageView.size))
        let wrapWidth = (rows-1)*(2*bubbleBuffer+Int(BubbleImageView.size))
        
        let wrapX = ((screenWidth - wrapWidth) / 2) - (wrapBuffer + bubbleBuffer)
        let wrapY = ((screenHeight - wrapHeight) / 2) - (wrapBuffer + bubbleBuffer)
        
        let wrap = UIView(frame: CGRectMake(CGFloat(wrapX), CGFloat(wrapY), CGFloat(wrapWidth), CGFloat(wrapHeight)))
        
        for row in 0...rows-1 {
            for col in 0...columns-1 {
                let bubble : BubbleImageView = BubbleImageView()
                let x = CGFloat(row*(2*bubbleBuffer+Int(BubbleImageView.size)))
                let y = CGFloat(col*(2*bubbleBuffer+Int(BubbleImageView.size)))
                bubble.frame = CGRectMake(x, y, BubbleImageView.size, BubbleImageView.size)
                
                let gesture = UITapGestureRecognizer(target: self, action: #selector(bubbleTapped(_:)))
                
                bubble.userInteractionEnabled = true
                bubble.addGestureRecognizer(gesture)
                bubble.userInteractionEnabled = true
                
                bubbleWrap.append(bubble)
                wrap.addSubview(bubble)
            }
        }

        self.view.addSubview(wrap)
    }
    
    func bubbleTapped(sender: UITapGestureRecognizer) {
        let bubble = sender.view as! BubbleImageView
        
        if bubble.isPopped() {
            return
        }
        
        bubble.pop()
        bubblesPopped += 1
        
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        if bubblesPopped == bubbleWrap.count {
            let controller = self.storyboard?.instantiateViewControllerWithIdentifier("DoneScreenViewController") as! DoneScreenViewController
            presentViewController(controller, animated: false, completion: nil)
        }
    }
    
}