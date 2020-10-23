//
//  StarterView.swift
//  StateAndDataFlow
//
//  Created by Vladimir on 23/10/2020.
//  Copyright © 2020 Embler. All rights reserved.
//

import SwiftUI

struct StarterView: View {
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        Group {
            if user.isRegister {
                ContentView()
            } else {
                RegisterView()
            }
        }.onAppear { self.user.isRegistered() }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
    }
}
