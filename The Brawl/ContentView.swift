//
//  ContentView.swift
//  The Brawl
//
//  Created by rémy seillier on 29/11/2021.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @State var firstView = true
    @State var timeRemaining = 2
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack{
            
        Text(" ")
            .onReceive(timer) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
                if timeRemaining == 0 {
                self.firstView = false
                }
                
        
                }
            if firstView == true {
                myAds()
            } else {
                launcherGame()
            }
            
        }.animation(.easeInOut, value: 10)
    
        } }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
