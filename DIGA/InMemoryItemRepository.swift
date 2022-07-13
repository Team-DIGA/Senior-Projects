//
//  InMemoryItemRepository.swift
//  DIGA
//
//  Created by Shogo Kanechika on 2022/07/13.
//

import Foundation

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
    
}

struct ItemState {
    var isHoihoi:Bool
    var changeChara:Int
    var digArray:[String]
    var changeBooster:Int
    var isEasyCap:Bool
    var isMaashi:Bool
    var isLegacy:Bool
}

func initialItem() -> ItemState{
    return ItemState(
        isHoihoi:false,
        changeChara: 0,
        digArray: [ "Masashi", "Shimabu", "Abiru", "エリーザ", "ご機嫌な島袋", "イサージ" ],
        changeBooster: 0,
        isEasyCap: false,
        isMaashi: false,
        isLegacy: false
    )
    
}

final class InMemoryItemRepository:ItemFunc{

    var itemObj = initialItem()
    //キャラクターホイホイ
    func changeHoihoi(){
        itemObj.isHoihoi.toggle()
    }
    


    func switchChara(itemNum: Int) {
        itemObj.changeChara = itemNum
    }

    func switchBooster(boosterNum: Int) {
        itemObj.changeBooster = boosterNum
    }
    

    func changeEasyCap(){
        itemObj.isEasyCap.toggle()
    }
    
    func changeMaashi(){
        itemObj.isMaashi.toggle()
    }
    
    func changeLegacy(){
        itemObj.isLegacy.toggle()
    }
    
    func getHoihoi() -> Bool{
        return itemObj.isHoihoi
    }
    

    func getChara() -> Int{
        return itemObj.changeChara
    }
    
    func getDigArray() -> [String] {
        return itemObj.digArray
    }
    
    func getBooster() -> Int {
        return itemObj.changeBooster
    }
    
    
    func getEasyCap() -> Bool {
        return itemObj.isEasyCap
    }
    
    func getMaashi() -> Bool{
        return itemObj.isMaashi
    }
    
    func getLegacy() -> Bool{
        return itemObj.isLegacy
    }


    //Erikoの権化




    //Yusuke

    
}
