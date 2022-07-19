//
//  InMemoryItemRepository.swift
//  DIGA
//
//  Created by Shogo Kanechika on 2022/07/13.
//

import Foundation
import UIKit
import AWSMobileClient



protocol ItemFunc{
    func changeHoihoi()
    func switchChara(itemNum:Int)
    func switchBooster(boosterNum:Int)
    func changeEasyCap()
    func changeMaashi()
    func changeLegacy()
    func getHoihoi() -> Bool
    func getChara() -> Int
    func getDigArray() -> [String]
    func getBooster() -> Int
    func getEasyCap() -> Bool
    func getMaashi() -> Bool
    func getLegacy() -> Bool
    func usePotato(view:UIViewController) -> UIAlertController
    func changeLevelState()
    func getLevelState() -> Bool
    func breakCursed()
    func onCursed()
    func getCursed() -> Bool
    func useCursed(view:UIViewController)
}

struct ItemState {
    var isHoihoi:Bool
    var changeChara:Int
    var digArray:[String]
    var changeBooster:Int
    var isEasyCap:Bool
    var isMaashi:Bool
    var isLegacy:Bool
    var levelState:Bool
}



func initialItem() -> ItemState{
    return ItemState(
        isHoihoi:false,
        changeChara: 0,
        digArray: [ "Masashi", "Shimabu", "Abiru", "エリーザ", "ご機嫌な島袋", "イサージ" ],
        changeBooster: 0,
        isEasyCap: false,
        isMaashi: false,
        isLegacy: false,
        levelState: false
    )
    
}

class InMemoryItemRepository:UIAlertController, ItemFunc{

    let userDataUtils = UserDataUtils()
    let delegate = UIApplication.shared.delegate as! AppDelegate

    var itemObj = initialItem()
    //キャラクターホイホイ
    func changeHoihoi(){
        delegate.isHoihoi.toggle()
    }
    


    func switchChara(itemNum: Int) {
//        itemObj.changeChara = itemNum
        delegate.changeChara = itemNum
    }

    func switchBooster(boosterNum: Int) {
        delegate.changeBooster = boosterNum
    }
    
    
    func changeEasyCap(){
        delegate.isEasyCap.toggle()
    }
    
    func changeMaashi(){
        delegate.isMaashi.toggle()
    }
    
    func changeLegacy(){
        delegate.isLegacy.toggle()
    }
    
    func getHoihoi() -> Bool{
        return delegate.isHoihoi
    }
    

    func getChara() -> Int{
//        return itemObj.changeChara
        return delegate.changeChara
    }
    
    func getDigArray() -> [String] {
        return itemObj.digArray
    }
    
    func getBooster() -> Int {
        return delegate.changeBooster
    }
    
    
    func getEasyCap() -> Bool {
        return delegate.isEasyCap
    }
    
    func getMaashi() -> Bool{
        return delegate.isMaashi
    }
    
    func getLegacy() -> Bool{
        return delegate.isLegacy
    }
    
    func changeLevelState() {
        itemObj.levelState.toggle()
    }

    func getLevelState() -> Bool {
        return itemObj.levelState
    }
    
    func breakCursed() {
        delegate.isCursed = false
    }
    
    func onCursed() {
        delegate.isCursed = true
    }
    
    func getCursed() -> Bool {
        return delegate.isCursed
    }
    
    func usePotato(view: UIViewController) -> UIAlertController {
        let randomItemNum = Int.random(in: 1...2)
        let alert = UIAlertController(title: "Potatoへの挑戦", message: "どっちか選べ", preferredStyle: .alert)
        let imageView = UIImageView(frame: CGRect(x: 10, y: 70, width: 250, height: 250))
        let height = NSLayoutConstraint(item: alert.view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 380)
        alert.view.addConstraint(height)
        imageView.image = UIImage(named: "Potato")
        alert.view.addSubview(imageView)

        
        
        do{
            guard let username = AWSMobileClient.default().username else {
                print("Error:uncaught userName")
                throw NSError(domain: "error", code: -1, userInfo: nil)
            }
       
        
        print("randomNum", randomItemNum)
            

            
        let btn1 = UIAlertAction(title: "A", style: UIAlertAction.Style.default, handler: {_ in
            if randomItemNum == 1 {
                self.userDataUtils.updateUserLvAndExp(name: username, myLv: 1, getExp: 0 )
                self.changeLevelState()
                print("up")
            } else {

                self.userDataUtils.updateUserLvAndExp(name: username, myLv: 100, getExp: 0)
                print("down")
            }
            self.alertPotatoResult(view: view)
        })
        let btn2 = UIAlertAction(title: "B", style: UIAlertAction.Style.default, handler: {_ in
            if randomItemNum == 1 {
                self.userDataUtils.updateUserLvAndExp(name: username, myLv: -1, getExp:0)
                print("down")
            } else {
                self.userDataUtils.updateUserLvAndExp(name: username, myLv: 1, getExp: 0)
                self.changeLevelState()
                print("up")
            }
            self.alertPotatoResult(view: view)
        })
    
        alert.addAction(btn1)
        alert.addAction(btn2)
        
//
//        let backAction: UIAlertAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) -> Void in
//            view.navigationController?.popViewController(animated: true)
//        })
//
//        alert.addAction(backAction)
        }catch{
            print("Error")
        }
            
        return alert
            
            
    }
    
    func alertPotatoResult(view: UIViewController){
        var title:String = ""
        if self.getLevelState() {
            title = "レベルUp！"
        } else {
            title = "レベルDown..."
        }
        
        let resultAlert = UIAlertController(title:title, message: "", preferredStyle: .alert)
        let height = NSLayoutConstraint(item: resultAlert.view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 380)
        resultAlert.view.addConstraint(height)
        
        let backAction: UIAlertAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler: {_ in
        })
        
        resultAlert.addAction(backAction)
        
        view.present(resultAlert, animated: true)
    }
    
    func useCursed(view: UIViewController){
    let resultAlert = UIAlertController(title:"ふふふ", message: "呪いの面が消えることはない", preferredStyle: .alert)
    let height = NSLayoutConstraint(item: resultAlert.view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 380)
    resultAlert.view.addConstraint(height)
    
    let backAction: UIAlertAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler: {_ in
    })
    
    resultAlert.addAction(backAction)
    
    view.present(resultAlert, animated: true)
}

}
