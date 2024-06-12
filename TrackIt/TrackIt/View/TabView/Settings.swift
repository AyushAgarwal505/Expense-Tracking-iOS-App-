//
//  Settings.swift
//  TrackIt
//
//  Created by Ayush Agarwal on 10/06/24.
//

import SwiftUI

struct Settings: View {
    @AppStorage("username") private var username : String = ""
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled : Bool = false
    @AppStorage("lockWhenAppGoesBackground") private var lockWhenAppGoesBackground : Bool = false

    var body: some View {
        NavigationStack{
            List{
                Section("User Name"){
                    TextField("Ayush", text: $username)
                }
                Section("App Lock"){
                    Toggle ("Enable App Lock", isOn: $isAppLockEnabled)
                    if isAppLockEnabled{
                        Toggle("Disable App Lock", isOn: $lockWhenAppGoesBackground)
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    Settings()
}
