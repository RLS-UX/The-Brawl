//
//  WoodFight.swift
//  The Brawl
//
//  Created by rémy seillier on 29/11/2021.
//

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



func gameManager(oderExe:Int, pOne:[Int], pTwo:[Int]) -> (pOneResult:[Int], pTwoResult:[Int], gameSaying:String) {
    var pOneResult:[Int] = [0,0,0]
    var pTwoResult:[Int] = [0,0,0]
    var gameSaying:String = " "
    
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
        gameSaying = "Le nouveau bouclier du \rJoueur 1 est de \(tempShield)."
    }
    
    //Player 1 charge an Attack
    if oderExe == 2 {
        let tempChargeAttack = cardSorting()
        pOneResult[2] = tempChargeAttack
        gameSaying = "Le Joueur 1 a chargé une attaque."
    }
    
    //Modify shield for the other Player
    if oderExe == 3 {
        let tempShield = cardSorting()
        pTwoResult[1] = tempShield
        gameSaying = "Le nouveau bouclier du \rJoueur 2 est de \(tempShield)."
    }
    
    //Player 1 tries to attack
    if oderExe == 4 {
        let tempAttaque = cardSorting()
        if pOne[2] != 0 {
            let suspendedAttack = pOne[2]
            if (tempAttaque+suspendedAttack) >= pTwo[1] {
                pTwoResult[0] =  pTwo[0]-((tempAttaque+suspendedAttack)-pTwo[1])
                gameSaying = "Le Joueur 1 a fait une attaque chargée.\rLa charge était de \(suspendedAttack) & \(tempAttaque).\rIl reste \(pTwoResult[0]) de vie au Joueur 2"
                pTwoResult[2] = 0
                pOneResult[2] = 0
            }
            else {
                gameSaying = "L'attaque a échouée."
                pOneResult[2] = 0
            }
        } else {
            if tempAttaque >= pTwo[1] {
                pTwoResult[0] =  pTwo[0]-(tempAttaque-pTwo[1])
                gameSaying = "Le joueur 1 a attaqué, il à fait une attaque de \(tempAttaque).\rLe joueur 2 à perdu \(tempAttaque-pTwo[1]) de vie."
                pTwoResult[2] = 0
                pOneResult[2] = 0
            } else {
                gameSaying = "L'attaque a échouée."
            }   }    }
    
    //Shield change Player 2
    if oderExe == 5 {
        let tempShield = cardSorting()
        pTwoResult[1] = tempShield
        gameSaying = "Le nouveau bouclier du \rJoueur 2 est de \(tempShield)."
    }
    
    //Player 2 charge an Attack
    if oderExe == 6 {
        let tempChargeAttack = cardSorting()
        pTwoResult[2] = tempChargeAttack
        gameSaying = "Le Joueur 2 a chargé une attaque."
    }
    
    //Modify shield for the other Player
    if oderExe == 7 {
        let tempShield = cardSorting()
        pOneResult[1] = tempShield
        gameSaying = "Le nouveau bouclier du \rJoueur 1 est de \(tempShield)."
    }
    
    //Player 2 tries to attack
    if oderExe == 8 {
        let tempAttaque = cardSorting()
        if pTwo[2] != 0 {
            let suspendedAttack = pTwo[2]
            if (tempAttaque+suspendedAttack) >= pOne[1] {
                pOneResult[0] = pOne[0]-((tempAttaque+suspendedAttack)-pOne[1])
                gameSaying = "Le Joueur 2 a fait une attaque chargée.\rLa charge était de \(suspendedAttack) & \(tempAttaque).\rIl reste \(pOneResult[0]) de vie au Joueur 2"
                pTwoResult[2] = 0
                pOneResult[2] = 0
            }
            else {
                gameSaying = "L'attaque a échouée."
                pTwoResult[2] = 0
            }
        } else {
            if tempAttaque >= pOne[1] {
                pOneResult[0] = pOne[0]-(tempAttaque-pOne[1])
                gameSaying = "Le joueur 2 a attaqué, il à fait une attaque de \(tempAttaque).\rLe joueur 1 à perdu \(tempAttaque-pOne[1]) de vie."
                pTwoResult[2] = 0
                pOneResult[2] = 0
            } else {
                gameSaying = "L'attaque a échouée."
            }   }    }
    
    
    return (pOneResult,pTwoResult,gameSaying)
}
