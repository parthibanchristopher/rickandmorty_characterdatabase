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
        NavigationView {
            if ViewModel.charactersArray.isEmpty {
                Text(ViewModel.displayMessage)
                    .padding()
            }
            else {
                ScrollView {
                    ForEach(ViewModel.charactersArray, id: \.id) { character in
                        NavigationLink(destination: DetailScreenView(character: character)) {
                            CharacterView(character: character)
                        }.accessibilityIdentifier("Character \(character.id)")
                    }
                }
                .navigationBarTitle("Rick & Morty Character List", displayMode: .inline)
            }
        }
    }
}
