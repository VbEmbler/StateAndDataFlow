//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Vladimir on 23/10/2020.
//  Copyright © 2020 Embler. All rights reserved.
//

import Combine
import SwiftUI

class UserManager: ObservableObject {
    @Published var isRegister = false
    var name = ""
    
    init() {}
    
    init(name: String) {
        self.name = name
    }
    
    func isRegistered() {
        guard let userName = UserDefaults.standard.value(forKey: "userName") else {
            return
        }
        name = userName as? String ?? ""
        isRegister = true
    }
    
    func logout() {
        UserDefaults.standard.removeObject(forKey: "userName")
        isRegister = false
    }
}
