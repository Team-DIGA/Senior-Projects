//
//  InMemoryItemRepository.swift
//  DIGA
//
//  Created by Shogo Kanechika on 2022/07/13.
//

import Foundation

protocol ItemFunc{
    func changeHoihoi()
    func changeYusuke()
    func switchChara(itemNum:Int)
    func getHoihoi() -> Bool
    func getYusuke() -> Bool
    func getChara() -> Int
    func getDigArray() -> [String]
}

struct ItemState {
    var isHoihoi, isYusuke:Bool
    var changeChara:Int
    var digArray:[String]
}

func initialItem() -> ItemState{
    return ItemState(
        isHoihoi:false,
        isYusuke: false,
        changeChara: 0,
        digArray: [ "Masashi", "Shimabu", "Abiru", "エリーザ", "ご機嫌な島袋", "イサージ" ]
    )
    
}

final class InMemoryItemRepository:ItemFunc{

    var itemObj = initialItem()
    //キャラクターホイホイ
    func changeHoihoi(){
        itemObj.isHoihoi.toggle()
    }
    
    func changeYusuke(){
        itemObj.isYusuke.toggle()
    }

    func switchChara(itemNum: Int) {
        itemObj.changeChara = itemNum
    }

    func getHoihoi() -> Bool{
        return itemObj.isHoihoi
    }
    
    func getYusuke() -> Bool{
        return itemObj.isYusuke
    }

    func getChara() -> Int{
        return itemObj.changeChara
    }
    
    func getDigArray() -> [String] {
        return itemObj.digArray
    }
    

    //Erikoの権化




    //Yusuke

    
}
