//
//  SSCustomTabBarDeligate.swift
//  DIGA
//
//  Created by Kazunori Nakajima on 2022/07/19.
//

import Foundation
import SSCustomTabbar
 
@objc protocol TabBarDelegate {
 
    func didSelectTab(tabBarController: TabBarController)
}
