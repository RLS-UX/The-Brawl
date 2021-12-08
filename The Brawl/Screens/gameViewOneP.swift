//
//  gameViewOneP.swift
//  The Brawl
//
//  Created by rémy seillier on 03/12/2021.
//

import SwiftUI

struct gameViewOneP: View {
    @State var pOneStats:[Int] = [30,4,0]     // <= [health,shield,charge Attack]
    @State var pIAStats:[Int] = [30,4,0]
    @State var pWhoGame:Int = 0
    @State var colorForPlay:[Color] =  [.gray,Color("myBrown-1"),.gray]
    @State var lastAction:String = "Recommended first action:\rchange shield"
    @State var timeRemaining = 3
    @State var theOrder = 7
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    var body: some View {
        
        
        GeometryReader { geometry in
            
            
            
            
            ZStack {
                Rectangle()
                    .foregroundColor(.black)
                    .ignoresSafeArea()
                
                LinearGradient(colors: colorForPlay, startPoint: .bottom, endPoint: .top)
                    .blur(radius: 90)
                    .ignoresSafeArea()
                    .opacity(0.7)
                centerScreen()
                    .ignoresSafeArea()
                    .opacity(0.175)
                LinearGradient(colors: colorForPlay, startPoint: .bottom, endPoint: .top)
                    .blur(radius: 90)
                    .ignoresSafeArea()
                    .opacity(0.1)
              
                // IA
                if pWhoGame != 0 {
                    Text("") //\(timeRemaining)")
                        .foregroundColor(.white)
                        .onReceive(timer) { _ in
                            if timeRemaining > 0 {
                                timeRemaining -= 1
                            } else {
                                if theOrder == 6 {
                                    self.theOrder = 8
                                } else {
                                    self.theOrder = Int.random(in: 4...8)
                                }
                                print(theOrder)
                                var tempAction = gameManager(oderExe: theOrder, pOne: pOneStats, pTwo: pIAStats)
                                self.pIAStats = tempAction.pTwoResult
                                self.pOneStats = tempAction.pOneResult
                                self.lastAction = tempAction.gameSaying
                                self.pWhoGame = 0
                                self.timeRemaining = 1
                                self.colorForPlay = [.gray,Color("myBrown-1"),.gray]
                            }
                        }
                }
                VStack {
                    Text("")
                        .frame(width: geometry.size.width, height: geometry.size.height*0.15)
                        topScreen(screenTxt: lastAction)
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    HStack {
                        gamerInfo(nameInfo: "I.A.", healthInfo: pIAStats[0], swordInfo: pIAStats[1])
                            .scaledToFit()
                            .frame(width: geometry.size.width*0.45)
                        gamerInfo(nameInfo: "Player 1", healthInfo: pOneStats[0], swordInfo: pOneStats[1])
                            .scaledToFit()
                            .frame(width: geometry.size.width*0.45)
                    }
                    
                    
                    
                    if pWhoGame == 0 {
                        HStack{
                            VStack{
                                if pOneStats[2] == 0 {
                                    Button(action: {
                                        let tempAction = gameManager(oderExe: 1, pOne: pOneStats, pTwo: pIAStats)
                                        self.pIAStats = tempAction.pTwoResult
                                        self.pOneStats = tempAction.pOneResult
                                        self.lastAction = tempAction.gameSaying
                                        self.pWhoGame = 180
                                        self.colorForPlay = [.black,Color("myBrown"),.black]
                                    }) {
                                        Text("Shield")
                                            .bold()
                                    }.buttonStyle(GradientButtonStyle(lesCouleurs: [.brown,Color("myBrown"),Color("myBrown-2")],numDegrees: 6))
                                    
                                }
//                                Spacer()
                                if pOneStats[2] == 0 {
                                    Button(action: {
                                        let tempAction = gameManager(oderExe: 2, pOne: pOneStats, pTwo: pIAStats)
                                        self.pIAStats = tempAction.pTwoResult
                                        self.pOneStats = tempAction.pOneResult
                                        self.lastAction = tempAction.gameSaying
                                        self.pWhoGame = 180
                                        self.colorForPlay = [.black,Color("myBrown"),.black]
                                    }) {
                                        Text("Load")
                                            .bold()
                                    }.buttonStyle(GradientButtonStyle(lesCouleurs: [.brown,Color("myBrown"),Color("myBrown-2")],numDegrees: 5))
                                    
                                }
                            }
//                            Spacer()
                            VStack{
                                if pOneStats[2] == 0 {
                                    Button(action: {
                                        let tempAction = gameManager(oderExe: 3, pOne: pOneStats, pTwo: pIAStats)
                                        self.pIAStats = tempAction.pTwoResult
                                        self.pOneStats = tempAction.pOneResult
                                        self.lastAction = tempAction.gameSaying
                                        self.pWhoGame = 180
                                        self.colorForPlay = [.black,Color("myBrown"),.black]
                                    }) {
                                        Text("Sabotage")
                                            .bold()
                                    }.buttonStyle(GradientButtonStyle(lesCouleurs: [.brown,Color("myBrown"),Color("myBrown-2")],numDegrees: -5))
                                    
                                }
//                                Spacer()
                                Button(action: {
                                    let tempAction = gameManager(oderExe: 4, pOne: pOneStats, pTwo: pIAStats)
                                    self.pIAStats = tempAction.pTwoResult
                                    self.pOneStats = tempAction.pOneResult
                                    self.lastAction = tempAction.gameSaying
                                    self.pWhoGame = 180
                                    self.colorForPlay = [.black,Color("myBrown"),.black]
                                }) {
                                    Text("Attack")
                                        .bold()
                                }.buttonStyle(GradientButtonStyle(lesCouleurs: [.brown,Color("myBrown"),Color("myBrown-2")],numDegrees: -6))
                            }
                        }
                    }
                    
                }   .ignoresSafeArea()
                    .scaledToFit()
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    
                
            }
        }
    }
    
}


struct gameViewOneP_Previews: PreviewProvider {
    static var previews: some View {
        gameViewOneP()
    }
}

