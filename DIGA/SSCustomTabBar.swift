//
//  SSCustomTabBar.swift
//  DIGA
//
//  Created by Kazunori Nakajima on 2022/07/19.
//

import UIKit
import SSCustomTabbar
 
class TabBarController: UITabBarController, UITabBarControllerDelegate {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
 
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        if viewController is TabBarDelegate {
            let v = viewController as! TabBarDelegate
            v.didSelectTab(tabBarController: self)
        }
    }
}
