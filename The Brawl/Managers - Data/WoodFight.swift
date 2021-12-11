//
//  WoodFight.swift
//  The Brawl
//
//  Created by rémy seillier on 29/11/2021.
//
//Ecran de fin à traduire.

import Foundation
import SwiftUI


func cardSorting() -> Int {
    let cardOne = Int.random(in: 1..<13)
    return cardOne
}

func itsOk() -> Bool {
    let thisIsBool = Bool.random()
    return thisIsBool
}

func healtColor(healt:Int) -> Color {
    var healtColor:Color = .green
    if healt > 5 {
        healtColor = .green
    } else {
        healtColor = .red
    }
    return healtColor
}

struct gameStructPlayer {
    var name:String
    var life:Int
    var shield:Int
}



func gameManager(oderExe:Int, pOne:[Int], pTwo:[Int], nameP1Imp:String, nameP2Imp:String) -> (pOneResult:[Int], pTwoResult:[Int], gameSaying:String) {
    var pOneResult:[Int] = [0,0,0]
    var pTwoResult:[Int] = [0,0,0]
    var gameSaying:String = " "
    var nameP1 = "nameP1Imp"
    var nameP2 = "nameP2Imp"
    
    nameP1 = nameP1Imp
    nameP2 = nameP2Imp
    pOneResult = pOne
    pTwoResult = pTwo
    
    //Error Code
    if oderExe == 0 {
        print("Error order no found(01)")
    }
    //Shield change Player 1
    if oderExe == 1 {
        let tempShield = cardSorting()
        pOneResult[1] = tempShield
        gameSaying = "\(nameP1) new shield is  \(tempShield)."
    }
    
    //Player 1 charge an Attack
    if oderExe == 2 {
        let tempChargeAttack = cardSorting()
        pOneResult[2] = tempChargeAttack
        gameSaying = "\(nameP1) has charged an attack."
    }
    
    //Modify shield for the other Player
    if oderExe == 3 {
        let tempShield = cardSorting()
        pTwoResult[1] = tempShield
        gameSaying = "\(nameP2) new shield is \(tempShield)."
    }
    
    //Player 1 tries to attack
    if oderExe == 4 {
        let tempAttaque = cardSorting()
        if pOne[2] != 0 {
            let suspendedAttack = pOne[2]
            if (tempAttaque+suspendedAttack) >= pTwo[1] {
                pTwoResult[0] =  pTwo[0]-((tempAttaque+suspendedAttack)-pTwo[1])
                gameSaying = "\(nameP1) made a charged attack. The charge was \(suspendedAttack) & \(tempAttaque).\r\(nameP2) has \(pTwoResult[0]) health"
                pTwoResult[2] = 0
                pOneResult[2] = 0
            }
            else {
                gameSaying = "The attack failed."
                pOneResult[2] = 0
            }
        } else {
            if tempAttaque >= pTwo[1] {
                pTwoResult[0] =  pTwo[0]-(tempAttaque-pTwo[1])
                gameSaying = "\(nameP1) attacked, he made an attack of  \(tempAttaque).\r\(nameP2) lost \(tempAttaque-pTwo[1]) health."
                pTwoResult[2] = 0
                pOneResult[2] = 0
            } else {
                gameSaying = "The attack failed."
            }   }    }
    
    //Shield change Player 2
    if oderExe == 5 {
        let tempShield = cardSorting()
        pTwoResult[1] = tempShield
        gameSaying = "\(nameP2) new shield is \(tempShield)."
    }
    
    //Player 2 charge an Attack
    if oderExe == 6 {
        let tempChargeAttack = cardSorting()
        pTwoResult[2] = tempChargeAttack
        gameSaying = "\(nameP2) has charged an attack."
    }
    
    //Modify shield for the other Player
    if oderExe == 7 {
        let tempShield = cardSorting()
        pOneResult[1] = tempShield
        gameSaying = "\(nameP1)'s new shield is\(tempShield)."
    }
    
    //Player 2 tries to attack
    if oderExe == 8 {
        let tempAttaque = cardSorting()
        if pTwo[2] != 0 {
            let suspendedAttack = pTwo[2]
            if (tempAttaque+suspendedAttack) >= pOne[1] {
                pOneResult[0] = pOne[0]-((tempAttaque+suspendedAttack)-pOne[1])
                gameSaying = "\(nameP2) made a charged attack. The charge was \(suspendedAttack) & \(tempAttaque).\r\(nameP1) has \(pOneResult[0]) health."
                pTwoResult[2] = 0
                pOneResult[2] = 0
            }
            else {
                gameSaying = "The attack failed."
                pTwoResult[2] = 0
            }
        } else {
            if tempAttaque >= pOne[1] {
                pOneResult[0] = pOne[0]-(tempAttaque-pOne[1])
                gameSaying = "\(nameP2) attacked, he made an attack of  \(tempAttaque).\r\(nameP2) has \(tempAttaque-pOne[1]) health."
                pTwoResult[2] = 0
                pOneResult[2] = 0
            } else {
                gameSaying = "The attack failed."
            }   }    }
    
    
    return (pOneResult,pTwoResult,gameSaying)
}
