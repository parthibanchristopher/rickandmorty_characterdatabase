//
//  ContentView.swift
//  rickandmorty_characterdatabase
//
//  Created by Admin on 30/9/22.
//

import SwiftUI

// MARK: HOME SCREEN VIEW
struct HomeScreenView: View {
    
    // MARK: PROPERTIES
    @StateObject private var ViewModel = HomeScreenViewModel()
    
    // MARK: VIEW
    var body: some View {
        Text("Hello World")
            .padding()
    }
}
