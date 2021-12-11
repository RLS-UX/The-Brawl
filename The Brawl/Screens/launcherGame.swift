//
//  launcherGame.swift
//  The Brawl
//
//  Created by rémy seillier on 29/11/2021.
//

import SwiftUI

struct launcherGame: View {
    @State var rulesOfGame = gamerules[Int.random(in: 0...4)]
    @State var goToView = false
    @State var onPlayer = false
    @State var textDegree = Double.random(in: -5...5)
    @State private var hasTimeElapsed = false
    var body: some View {
    let xy:CGFloat = 1
    let theRadius:CGFloat = 2
        ZStack {
            if goToView == false {
                
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundColor(.black)
                centerScreen()
                    .padding(-40)
                    .rotationEffect(.degrees(0))
                    .ignoresSafeArea()
                    .opacity(0.10)
            }
            if goToView == false {
                VStack {
                    Spacer()
                
                Button(action: {
                    self.onPlayer = true
                    self.goToView = true
                    for family in UIFont.familyNames.sorted() {
                        let names = UIFont.fontNames(forFamilyName: family)
                    }
                }, label: {
                    
                    Text("1 Players")
                        .font(Font.custom("Zapfino", size: 22))
                        .foregroundColor(.black)
                        .padding()
                        .shadow(color: .red, radius: theRadius, x: -xy, y: xy)
                        .shadow(color: .blue, radius: theRadius, x: xy, y: -xy)
                        .shadow(color: .white, radius: theRadius, x: 0, y: 0)
                        .shadow(color: .green, radius: theRadius, x: -xy, y: xy)
                        .rotationEffect(.degrees(textDegree))
                    Text("")
                })
                
                Button(action: {
                    self.goToView = true
                }, label: {
                    
                        
                
                        Text("2 Players")
                            .font(Font.custom("Zapfino", size: 22))
                            .foregroundColor(.black)
                            .padding()
                            .shadow(color: .red, radius: theRadius, x: -xy, y: xy)
                            .shadow(color: .blue, radius: theRadius, x: xy, y: -xy)
                            .shadow(color: .white, radius: theRadius, x: 0, y: 0)
                            .shadow(color: .green, radius: theRadius, x: -xy, y: xy)
                            .rotationEffect(.degrees(-textDegree))
                        Text("")
                     } )
                    
                } } else {
                if onPlayer == true {
                    gameViewOneP().transition(.slide)
                } else {
                    gameViewTwoP().transition(.slide)
                }
            }
            if goToView == false {
                VStack{
                    Text(" ")
                    Text(rulesOfGame)
                        .bold()
                        .multilineTextAlignment(.center)
                        .gradientForeground(colors: [.brown,.yellow,.brown])
                        .font(Font.custom("Zapfino", size: 32))
                        .rotationEffect(.degrees(textDegree))
               Spacer()
                }.onTapGesture {
                    self.rulesOfGame = gamerules[Int.random(in: 0...4)]
                    self.textDegree = Double.random(in: -5...5)
                }
                
            }
            }
        
    }
}



extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: .init(colors: colors),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
            .mask(self)
    }
}


struct launcherGame_Previews: PreviewProvider {
    static var previews: some View {
        launcherGame()
    }
}
