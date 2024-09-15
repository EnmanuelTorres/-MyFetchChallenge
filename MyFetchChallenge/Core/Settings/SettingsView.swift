//
//  SettingsView.swift
//  MyFetchChallenge
//
//  Created by ENMANUEL TORRES on 4/09/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Text("Your Settings")
                .navigationTitle("Settings")
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    SettingsView()
}
