//
//  gamerInfo.swift
//  The Brawl
//
//  Created by rémy seillier on 29/11/2021.
//


import SwiftUI

struct gamerInfo: View {
    let nameInfo:String
    let healthInfo:Int
    let swordInfo:Int
    var body: some View {
        ZStack {
            Image("planche")
                .resizable()
                .scaledToFit()
                .frame(width: 175, alignment: .center)
                .shadow(color: .black, radius: 2, x: 2, y: 2)
                .shadow(color: .white, radius: 0, x: -1, y: -1)

            VStack{
                Text(nameInfo)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 1, x: 1, y: 1)
                    .shadow(color: .black, radius: 1, x: -1, y: -1)

                Text("")
                HStack {
                    Image(systemName: "suit.heart.fill")
                        .foregroundColor(Color("myBrown"))
                    Text(": \(healthInfo)")
                        .bold()
                        .foregroundColor(healtColor(healt: healthInfo))
                    Text("   ")
                    Image(systemName: "shield.lefthalf.fill")
                        .foregroundColor(Color("myBrown"))
                        .foregroundStyle(.regularMaterial)
                    Text(": \(swordInfo)")
                        .bold()
                        .foregroundColor(healtColor(healt: swordInfo))
                }.padding(0)
                .font(.system(size: 18))
                .shadow(color: .white, radius: 1, x: -1, y: -1)
                .shadow(color: .black, radius: 2, x: 1, y: 1)
                .shadow(color: .black, radius: 1, x: 1, y: 1)
                
            }.padding()
        }
    }
}

struct gamerInfo_Previews: PreviewProvider {
    static var previews: some View {
        gamerInfo(nameInfo: "J O U E U R 1", healthInfo: 20, swordInfo: 20)
    }
}
