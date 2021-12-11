//
//  settingModal.swift
//  The Brawl
//
//  Created by rémy seillier on 11/12/2021.
//

import SwiftUI

struct settingModal: View {
    @State var settingButton:Bool
    var body: some View {
        Text("settings")
    }
}

struct settingModal_Previews: PreviewProvider {
    static var previews: some View {
        settingModal(settingButton: true)
    }
}
