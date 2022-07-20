//
//  DigaUI.swift
//  DIGA
//
//  Created by Kazunori Nakajima on 2022/07/19.
//

import UIKit

class DigaButton: UIButton {
    
    required init (coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
    }


    override init (frame: CGRect){
        super.init(frame: frame)
        self.setTitle("Custom", for: UIControl.State.normal)
        
        self.backgroundColor = UIColor.orange
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 32
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 4
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
    }
}
