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
    func getHoihoi() -> Bool
    func getChara() -> Int
    func getDigArray() -> [String]
}

struct ItemState {
    var isHoihoi:Bool
    var changeChara:Int
    var digArray:[String]
}

func initialItem() -> ItemState{
    return ItemState(
        isHoihoi:false,
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
    


    func switchChara(itemNum: Int) {
        itemObj.changeChara = itemNum
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
    

    //Erikoの権化




    //Yusuke

    
}
