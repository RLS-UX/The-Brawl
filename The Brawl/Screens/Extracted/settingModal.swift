//
//  settingModal.swift
//  The Brawl
//
//  Created by rémy seillier on 11/12/2021.
//

import SwiftUI
import CoreData

struct settingModal: View {
    @State var settingButton:Bool
    @State var settingModif:[String] = defaultData
    var body: some View {
        VStack{
        List {
                                    HStack {
                                        Text("Name One :").font(.headline)
                                        TextField("Name...", text: $settingModif[0]).foregroundColor(.brown)
                                            
                                    }
                                    .padding(.trailing)
                                    HStack {
                                        Text("Name Two :").font(.headline)
                                        TextField("Name...",text: $settingModif[1]).foregroundColor(.brown)
                                            
                                    } }
//            Button(action: {
//                self.defaultData = settingModif
//            }, label: {
//                Text("Save")
//            })
        }
        }
}

struct settingModal_Previews: PreviewProvider {
    static var previews: some View {
        settingModal(settingButton: true,settingModif: defaultData)
    }
}
