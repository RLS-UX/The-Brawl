//
//  myAds.swift
//  The Brawl
//
//  Created by rémy seillier on 29/11/2021.
//

import SwiftUI

struct myAds: View {
    @State var timeRemaining = 5
    @State var logoOpacity = 1.12
    @State var logoBlur:CGFloat = 12
    @State var parenthezeAnimation = 0.0
    let timer = Timer.publish(every: 0.001, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .ignoresSafeArea()
                .opacity(0.9)
            Image("parentheze")
                
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(logoOpacity)
                .onReceive(timer) { _ in
                    if timeRemaining > 0 {
                        timeRemaining -= 1
                    }
                    if parenthezeAnimation != 360 {
                        self.parenthezeAnimation += 1
                        self.logoOpacity -= 0.001
                    }
                    if logoBlur != 0 {
                        self.logoBlur -= 1
                    }
            
                    }
                .rotationEffect(.degrees(Double(parenthezeAnimation)))
                .shadow(color: .white, radius: 0, x: 0, y: -1)
                .shadow(color: .black, radius: 0, x: 1, y: 0)
                .blur(radius: (logoBlur))
            VStack{
                Spacer()
                Spacer()
                Text("")
                Spacer()
                Text("Powered by Seillier Rémy")
                    .foregroundColor(.white)
                    .font(.system(size: 10))
            }
        }
      
    }
}

struct myAds_Previews: PreviewProvider {
    static var previews: some View {
        myAds()
    }
}
