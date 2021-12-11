//
//  topScreen.swift
//  The Brawl
//
//  Created by rémy seillier on 07/12/2021.
//

import SwiftUI

struct topScreen: View {
    let screenTxt:String
    var body: some View {
        GeometryReader { geometry in
            let tableheigh = geometry.size.height * 0.5
            let tablewidth = geometry.size.width
            ZStack{
                Image("planche-1")
                    .resizable()
                    .frame(width: tablewidth, height: tableheigh, alignment: .center)
                    .shadow(color: Color("myBrown-1"), radius: 1, x: -1, y: -1)
                    .shadow(color: .black, radius: 1, x: 1, y: 1)
                Text(screenTxt)
                    .frame(width: tablewidth*0.95, height: tableheigh*0.9, alignment: .center)
                    .scaledToFit()
                    .minimumScaleFactor(0.01)
                    .lineLimit(4)
                    .font(Font.custom("Song-of-coronos", size: 30))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .shadow(color: .yellow, radius: 1, x: -1, y: -1)
                    .shadow(color: .black, radius: 2, x: 2, y: 2)
                    .padding(0)
                
            } .scaledToFit()
            
        }
    }
}

struct topScreen_Previews: PreviewProvider {
    static var previews: some View {
        topScreen(screenTxt: "Le joueur 1 à avancer de deux pas, et là j'ecris vraiment n'importe quoi, car il me faut 4 lignes.")
    }
}
