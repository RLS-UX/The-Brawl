//
//  launcherGame.swift
//  The Brawl
//
//  Created by rémy seillier on 29/11/2021.
//

import SwiftUI

struct launcherGame: View {
    @State var rulesOfGame = gamerules[Int.random(in: 0...4)]
    @State var textDegree = Double.random(in: -5...5)
    @State var settingModif:[String] = defaultData
    @State var wrongAttempt: Bool = false
    @State var nmbrAnimation = 0
    var body: some View {
        let xy:CGFloat = 1
        let theRadius:CGFloat = 2
        NavigationView {
            ZStack {
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundColor(.black)
                centerScreen()
                    .opacity(0.1).padding(-50)
                
                
                VStack {
                    Spacer()
                    Text(rulesOfGame)
                        .bold()
                        .multilineTextAlignment(.center)
                        .font(Font.custom("Zapfino", size: 32))
                        .rotationEffect(.degrees(textDegree))
                        .foregroundColor(.white)
                        .offset(x: CGFloat.random(in: -15...5),y: CGFloat.random(in: -5...15))
                        .animation(Animation.default.repeatCount(nmbrAnimation))
                        .shadow(color: .brown, radius: 1, x: 0, y: 0)
                        .shadow(color: .yellow, radius: 3, x: 0, y: 0)
                        .shadow(color: .white, radius: 4, x: 0, y: 0)
                        .onShake {
                            self.nmbrAnimation = Int.random(in: 0...4)
                            self.rulesOfGame = gamerules[Int.random(in: 0...4)]
                            self.wrongAttempt.toggle()
                            print("Device shaken!")
                        }
                    NavigationLink(destination: gameViewOneP()
                                   , label:
                                    {
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .foregroundColor(Color("myBrown-1")).opacity(0.2)
                                .frame(width: 200, height: 80)
                                .shadow(color: .white, radius: 2, x: -1, y: -1)
                                .shadow(color: .black, radius: 2, x: 1, y: 1)
                            Text("1 Players")
                                .font(Font.custom("Zapfino", size: 22))
                                .foregroundColor(.black)
                                .padding()
                                .shadow(color: .red, radius: theRadius, x: -xy, y: xy)
                                .shadow(color: .blue, radius: theRadius, x: xy, y: -xy)
                                .shadow(color: .white, radius: theRadius, x: 0, y: 0)
                                .shadow(color: .green, radius: theRadius, x: -xy, y: xy)
                            
                        }
                        .rotationEffect(.degrees(-textDegree))
                    } )
                    NavigationLink(destination: gameViewTwoP(),
                                   label:
                                    {
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .foregroundColor(Color("myBrown-1")).opacity(0.2)
                                .frame(width: 200, height: 80)
                                .shadow(color: .white, radius: 2, x: -1, y: -1)
                                .shadow(color: .black, radius: 2, x: 1, y: 1)
                            Text("2 Players")
                                .font(Font.custom("Zapfino", size: 22))
                                .foregroundColor(.black)
                                .padding()
                                .shadow(color: .red, radius: theRadius, x: -xy, y: xy)
                                .shadow(color: .blue, radius: theRadius, x: xy, y: -xy)
                                .shadow(color: .white, radius: theRadius, x: 0, y: 0)
                                .shadow(color: .green, radius: theRadius, x: -xy, y: xy)
                            
                        }.rotationEffect(.degrees(textDegree))
                        
                    }
                    )
                    Text("\r")
                    HStack{
                        Spacer()
                        NavigationLink(destination: settingModal(settingButton: true, settingModif: defaultData), label: {
                            Image(systemName: "gearshape.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40)
                                .symbolRenderingMode(.hierarchical)
                                .foregroundColor(Color("myBrown-1"))
                                .shadow(color: .white, radius: 0, x: -1, y: -1)
                                .offset(x: CGFloat.random(in: -15...5),y: CGFloat.random(in: -5...15))
                                .animation(Animation.default.repeatCount(nmbrAnimation))
                        })
                    }
                }
            }.navigationTitle("").navigationBarHidden(true)
        }
    }
}






struct launcherGame_Previews: PreviewProvider {
    static var previews: some View {
        launcherGame()
    }
}
