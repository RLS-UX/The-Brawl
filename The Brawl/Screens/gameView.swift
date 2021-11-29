//
//  gameView.swift
//  The Brawl
//
//  Created by rémy seillier on 29/11/2021.
//

import Foundation
import SwiftUI

struct gameView: View {
    @State var randMildle = Double.random(in: -2...2)
    @State var arrayXY:[CGFloat] = [1,1]
    @State var pWhoGame:Int = 0          // <= angle fleche du milieu
    @State var pOneStats:[Int] = [30,4,0]     // <= [Vie,Boublier,attaque de charge]
    @State var pTwoStats:[Int] = [30,4,0]
    @State var colorForPlay:[Color] =  [.black,Color("myBrown"),.black]
    //[.teal,.purple,.teal]
    @State var lastAction:String = " Première action conseillée : \rCharger le bouclier"
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .foregroundColor(.black)
                    .ignoresSafeArea()
                LinearGradient(colors: colorForPlay, startPoint: .bottom, endPoint: .top)
                //                .opacity(0.95)
                    .blur(radius: 90)
                    .ignoresSafeArea()
                centerScreen()
                    .ignoresSafeArea()
                    .padding(-20)
                    .opacity(0.10)
                if pOneStats[0] > 0 && pTwoStats[0] > 0 {
                    VStack {
                        VStack {
                            if pWhoGame == 180 {
                                HStack{
                                    Spacer()
                                    if pTwoStats[2] == 0 {
                                        Button(action: {
                                            let tempAction = gameManager(oderExe: 5, pOne: pOneStats, pTwo: pTwoStats)
                                            self.pTwoStats = tempAction.pTwoResult
                                            self.pOneStats = tempAction.pOneResult
                                            self.lastAction = tempAction.gameSaying
                                            self.pWhoGame = 0
                                            self.arrayXY = [1,1]
                                            self.colorForPlay = [.black,Color("myBrown-1"),.black]
                                        }) {
                                            Text("Bouclier")
                                                .bold()
                                        }.buttonStyle(GradientButtonStyle(lesCouleurs: [.brown,Color("myBrown"),Color("myBrown-1")],numDegrees: 6)) }
                                    if pTwoStats[2] == 0 {
                                        Button(action: {
                                            let tempAction = gameManager(oderExe: 6, pOne: pOneStats, pTwo: pTwoStats)
                                            self.pTwoStats = tempAction.pTwoResult
                                            self.pOneStats = tempAction.pOneResult
                                            self.lastAction = tempAction.gameSaying
                                            self.pWhoGame = 0
                                            self.arrayXY = [1,1]
                                            self.colorForPlay = [.black,Color("myBrown-1"),.black]
                                        }) {
                                            Text("Charger")
                                                .bold()
                                        }.buttonStyle(GradientButtonStyle(lesCouleurs: [.brown,Color("myBrown"),Color("myBrown-1")],numDegrees: -5)) }
                                    if pTwoStats[2] == 0 {
                                        Button(action: {
                                            let tempAction = gameManager(oderExe: 7, pOne: pOneStats, pTwo: pTwoStats)
                                            self.pTwoStats = tempAction.pTwoResult
                                            self.pOneStats = tempAction.pOneResult
                                            self.lastAction = tempAction.gameSaying
                                            self.pWhoGame = 0
                                            self.arrayXY = [1,1]
                                            self.colorForPlay = [.black,Color("myBrown-1"),.black]
                                        }) {
                                            Text("Sabotage")
                                                .bold()
                                        }.buttonStyle(GradientButtonStyle(lesCouleurs: [.brown,Color("myBrown"),Color("myBrown-1")],numDegrees: 5))
                                    }
                                    Button(action: {
                                        let tempAction = gameManager(oderExe: 8, pOne: pOneStats, pTwo: pTwoStats)
                                        self.pTwoStats = tempAction.pTwoResult
                                        self.pOneStats = tempAction.pOneResult
                                        self.lastAction = tempAction.gameSaying
                                        self.pWhoGame = 0
                                        self.arrayXY = [1,1]
                                        self.colorForPlay = [.black,Color("myBrown-1"),.black]
                                    }) {
                                        Text("Attaquer")
                                            .bold()
                                    }.buttonStyle(GradientButtonStyle(lesCouleurs: [.brown,Color("myBrown"),Color("myBrown-1")],numDegrees: -6))
                                }
                            }
                        }
                        .scaledToFit()
                            .frame(width: geometry.size.width*0.5)
                            .rotationEffect(.degrees(-180))
                        VStack{
                            gamerInfo(nameInfo: "Joueur 2", healthInfo: pTwoStats[0], swordInfo: pTwoStats[1])
                                .rotationEffect(.degrees(Double(180)))
                                .frame(width: geometry.size.width/2)
                                .scaledToFit()
                            VStack{
                                Text(lastAction)
                                    .frame(width: geometry.size.width/2.1)
                                    .scaledToFit()
                                    .minimumScaleFactor(0.01)
                                    .lineLimit(4)
                                    .font(.largeTitle)
                                    .foregroundColor(Color("colorTxt"))
                                    .multilineTextAlignment(.center)
                                    .shadow(color: Color("myBrown"), radius: 1, x: -1, y: -1)
                                    .shadow(color: Color("myBrown-1"), radius: 1, x: 1, y: 1)
                                    .padding()
                                    .rotationEffect(.degrees(-180))
                                Image("fleche")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:geometry.size.width*0.3)
                                    .shadow(color: .black, radius: 2, x: 2, y: 3)
                                    .rotationEffect(.degrees(Double((pWhoGame-90))))
                                Text(lastAction)
                                    .frame(width: geometry.size.width/2.1)
                                    .scaledToFit()
                                    .minimumScaleFactor(0.01)
                                    .lineLimit(4)
                                    .font(.largeTitle)
                                    .foregroundColor(Color("colorTxt"))
                                    .multilineTextAlignment(.center)
                                    .shadow(color: Color("myBrown"), radius: 1, x: -1, y: -1)
                                    .shadow(color: Color("myBrown-1"), radius: 1, x: 1, y: 1)
                                    .padding()
                            }.scaledToFit()
                            gamerInfo(nameInfo: "Joueur 1", healthInfo: pOneStats[0], swordInfo: pOneStats[1])
                        }
                        Spacer()
                        if pWhoGame == 0 {
                            HStack{
                                
                                if pOneStats[2] == 0 {
                                    Button(action: {
                                        let tempAction = gameManager(oderExe: 1, pOne: pOneStats, pTwo: pTwoStats)
                                        self.pTwoStats = tempAction.pTwoResult
                                        self.pOneStats = tempAction.pOneResult
                                        self.lastAction = tempAction.gameSaying
                                        self.pWhoGame = 180
                                        self.arrayXY = [-1,-1]
                                        self.colorForPlay = [.black,Color("myBrown"),.black]
                                    }) {
                                        Text("Bouclier")
                                            .bold()
                                    }.buttonStyle(GradientButtonStyle(lesCouleurs: [.brown,Color("myBrown"),Color("myBrown-1")],numDegrees: 6))
                                    
                                }
                                if pOneStats[2] == 0 {
                                    Button(action: {
                                        let tempAction = gameManager(oderExe: 2, pOne: pOneStats, pTwo: pTwoStats)
                                        self.pTwoStats = tempAction.pTwoResult
                                        self.pOneStats = tempAction.pOneResult
                                        self.lastAction = tempAction.gameSaying
                                        self.pWhoGame = 180
                                        self.arrayXY = [-1,-1]
                                        self.colorForPlay = [.black,Color("myBrown"),.black]
                                    }) {
                                        Text("Charger")
                                            .bold()
                                    }.buttonStyle(GradientButtonStyle(lesCouleurs: [.brown,Color("myBrown"),Color("myBrown-1")],numDegrees: -5))
                                    
                                }
                                if pOneStats[2] == 0 {
                                    Button(action: {
                                        let tempAction = gameManager(oderExe: 3, pOne: pOneStats, pTwo: pTwoStats)
                                        self.pTwoStats = tempAction.pTwoResult
                                        self.pOneStats = tempAction.pOneResult
                                        self.lastAction = tempAction.gameSaying
                                        self.pWhoGame = 180
                                        self.arrayXY = [-1,-1]
                                        self.colorForPlay = [.black,Color("myBrown"),.black]
                                    }) {
                                        Text("Sabotage")
                                            .bold()
                                    }.buttonStyle(GradientButtonStyle(lesCouleurs: [.brown,Color("myBrown"),Color("myBrown-1")],numDegrees: 5))
                                    
                                }
                                Button(action: {
                                    let tempAction = gameManager(oderExe: 4, pOne: pOneStats, pTwo: pTwoStats)
                                    self.pTwoStats = tempAction.pTwoResult
                                    self.pOneStats = tempAction.pOneResult
                                    self.lastAction = tempAction.gameSaying
                                    self.pWhoGame = 180
                                    self.arrayXY = [-1,-1]
                                    self.colorForPlay = [.black,Color("myBrown"),.black]
                                }) {
                                    Text("Attaquer")
                                        .bold()
                                }.buttonStyle(GradientButtonStyle(lesCouleurs: [.brown,Color("myBrown"),Color("myBrown-1")],numDegrees: -6))
                                
                            }.scaledToFit()
                                .frame(width: geometry.size.width*0.5)
                        }
                    }
                    
                }
                else
                {
                    Text("Fin de jeu \rJ O U E U R   1 : \(pOneStats[0])\rJ O U E U R   2 : \(pTwoStats[0])\rAppuie pour restart")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .shadow(color: .red, radius: 3, x: 2, y: 2)
                        .shadow(color: .green, radius: 3, x: -2, y: 2)
                        .shadow(color: .mint, radius: 3, x: -2, y: -2)
                        .onTapGesture {
                            self.pOneStats = [30,4,0]
                            self.pTwoStats = [30,4,0]
                            self.pWhoGame = 180
                            self.lastAction = "Nouvelle partie"
                        }
                }
            }
        }
        // .ignoresSafeArea()
        .scaledToFill()
    } }

struct GradientButtonStyle: ButtonStyle {
    var lesCouleurs:[Color]
    var numDegrees:Int
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaledToFill()
            .minimumScaleFactor(0.1)
            .lineLimit(1)
            .font(.system(size: 50))
            .foregroundColor(.white)
            .padding()
            .shadow(color: Color("myBrown"), radius: 0, x: 0, y: -1)
            .shadow(color: .black, radius: 1, x: 0, y: 1)
            .background(LinearGradient(gradient: Gradient(colors: lesCouleurs), startPoint: .top, endPoint: .bottom))
            .cornerRadius(30.0)
            .shadow(color: Color("myBrown-1"), radius: 1, x: -1, y: -1)
            .shadow(color: .black, radius: 1, x: 1, y: 1)
            .rotationEffect(.degrees(Double(numDegrees)))
    }
}

struct gameView_Previews: PreviewProvider {
    static var previews: some View {
        gameView()
    }
}
