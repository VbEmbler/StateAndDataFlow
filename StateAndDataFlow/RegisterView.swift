//
//  RegistereView.swift
//  StateAndDataFlow
//
//  Created by Vladimir on 23/10/2020.
//  Copyright © 2020 Embler. All rights reserved.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @EnvironmentObject var user: UserManager
    
    private var isCharEnough: Bool {
        name.count < 3 ? false : true
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .trailing) {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                countCharLabel(count: name.count)
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(!isCharEnough)
        }
    }
}

struct countCharLabel: View {
    let count: Int
    
    private var labelTextColor: Color {
        count < 3 ? .red : .green
    }
    
    var body: some View {
        Text("\(count)")
            .foregroundColor(labelTextColor)
        .padding(.trailing, 20)
    }
}

extension RegisterView {
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegister = true
            UserDefaults.standard.set(name, forKey: "userName")
        }
    }
}

struct RegistereView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
        .environmentObject(UserManager())
    }
}
