//
//  DigaUI.swift
//  DIGA
//
//  Created by Kazunori Nakajima on 2022/07/19.
//

// PositiveSimpleButton.swift
import Foundation
import UIKit
@IBDesignable
class PositiveSimpleButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        customDesign()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customDesign()
    }
  
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        customDesign()
    }
  
    private func customDesign() {
        backgroundColor = UIColor(named: "NavigationBar")
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 40.0)
        contentEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        layer.cornerRadius = 15.0
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 10
        layer.shadowRadius = 10
        layer.shadowColor = UIColor.white.cgColor
        layer.cornerRadius = 10
    }
}

class GatyaButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        gatyaButtonDesign()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        gatyaButtonDesign()
    }
  
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        gatyaButtonDesign()
    }
  
    private func gatyaButtonDesign() {
        backgroundColor = UIColor(named: "NavigationBar")
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 30.0)
        contentEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        layer.cornerRadius = 15.0
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 10
        layer.shadowRadius = 10
        layer.shadowColor = UIColor.white.cgColor
        layer.cornerRadius = 10
    }
}

//extension UIColor {
//    class var digagreen: UIColor{
//        return UIColor(named: "DigaGreen")
//    }
//}
