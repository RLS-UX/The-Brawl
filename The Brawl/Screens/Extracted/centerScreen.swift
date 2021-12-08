//
//  centerScreen.swift
//  The Brawl
//
//  Created by rémy seillier on 29/11/2021.
//

import SwiftUI

struct centerScreen: View {

    var body: some View {
        GeometryReader { geometry in
            let tableheigh = geometry.size.height * 1.5
            let tablewidth = geometry.size.width * 1.5
            ZStack{
                Image("planche-1")
                    .resizable()
                    
                    .shadow(color: Color("myBrown-1"), radius: 1, x: -1, y: -1)
                    .shadow(color: .black, radius: 1, x: 1, y: 1)
            }
            .padding([.top, .leading], -100.0)
            .frame(width: tablewidth, height: tableheigh, alignment: .top)
        }
        
    } }

struct centerScreen_Previews: PreviewProvider {
    static var previews: some View {

        centerScreen()
    }
}
