//
//  BubbleImageView.swift
//  nChill
//
//  Created by Deyana Marsh on 4/21/16.
//  Copyright © 2016 Darcy Meyer. All rights reserved.
//

import UIKit

class BubbleImageView: UIImageView {

    static let size: CGFloat = 40
    
    var popped: Bool = false
    
    init() {
        super.init(image: UIImage(named: "bubble"))
        
        let origin = self.frame.origin;
        
        let newFrame: CGRect = CGRectMake(origin.x, origin.y, BubbleImageView.size, BubbleImageView.size)
        self.frame = newFrame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func pop() {
        image = UIImage(named: "popped-bubble")
        popped = true
    }
    
    func isPopped() -> Bool {
        return popped
    }

}
