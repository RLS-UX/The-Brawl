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
    @State var textDegree = Double.random(in: -5...5)
    @State private var hasTimeElapsed = false
    var body: some View {
    let xy:CGFloat = 1
    let theRadius:CGFloat = 2
        ZStack {
            if goToView == false {
                Rectangle()
                    .ignoresSafeArea()
                .foregroundColor(.black) }
            if goToView == false {
                Button(action: {
                    self.goToView = true
                }, label: {
                    VStack {
                        
                        Spacer()
                        Text("2 Players")
                            //.font(Font.custom("EnchantedLand", size: 33))
                            //.font(.system(size: 60))
                            .bold()
                            .foregroundColor(.black)
                            .padding()
                            .shadow(color: .red, radius: theRadius, x: -xy, y: xy)
                            .shadow(color: .blue, radius: theRadius, x: xy, y: -xy)
                            .shadow(color: .white, radius: theRadius, x: 0, y: 0)
                            .shadow(color: .green, radius: theRadius, x: -xy, y: xy)
                            .rotationEffect(.degrees(-textDegree))
                        Text("")
                    } } )
            } else {
                gameView().transition(.slide)
            }
            if goToView == false {
                VStack{
                    Text(rulesOfGame)
                        .bold()
                        .multilineTextAlignment(.center)
                        .gradientForeground(colors: [.brown,.yellow,.brown])
                        .font(.system(size: CGFloat.random(in: 20...30)))
                        .rotationEffect(.degrees(textDegree))
//                        .shadow(color: .red, radius: 0, x: 1, y: -1)
//                        .shadow(color: .green, radius: 0, x: -1, y: 1)
                }.onTapGesture {
                    self.rulesOfGame = gamerules[Int.random(in: 0...4)]
                    self.textDegree = Double.random(in: -5...5)
                }
                
            };}
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
