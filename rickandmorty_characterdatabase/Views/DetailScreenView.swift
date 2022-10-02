//
//  DetailScreenView.swift
//  rickandmorty_characterdatabase
//
//  Created by Admin on 30/9/22.
//

import Foundation
import SwiftUI

// MARK: DETAIL SCREEN VIEW
struct DetailScreenView: View {
    
    // MARK: PROPERTIES
    
    // reference to character object that was selected from homescreen
    let character: CharacterModel
    
    // MARK: VIEW
    var body: some View {
        
        ScrollView {
            AsyncImage(url: URL(string: character.image))
            VStack(spacing: 10) {
                
                Text(character.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.vertical)
                    .accessibilityIdentifier("Character Name")
                
                Text("Species: \(character.species)").accessibilityIdentifier("Character Species")
                Text("Gender: \(character.gender)").accessibilityIdentifier("Character Gender")
                Text("Origin: \(character.origin.name)").accessibilityIdentifier("Character Origin")
                Text("Created On: \(createDate(longDate: character.created))").accessibilityIdentifier("Character Date")
                Text("Current Status: \(character.status)").accessibilityIdentifier("Character Status")
                Text("Current Location: \(character.location.name)").accessibilityIdentifier("Character Location")
                
                Text("List of Episode Appearance:\n\(createstring(episodelist: character.episode))")
                    .padding(.vertical)
                    .accessibilityIdentifier("Character Episodes")
                    .multilineTextAlignment(.center)
            }
            .padding()
        }
    }
    
    // MARK: FUNCTIONS
    
    // function to convert array of episodes into string for display
    func createstring(episodelist: [String]) -> String {
        var returnEpisodeString = ""
        for episode in episodelist {
            let episodeArray = episode.components(separatedBy: "/")
            if episode == episodelist.last {
                returnEpisodeString.append("Episode \(episodeArray.last!)")
            }
            else {
                returnEpisodeString.append("Episode \(episodeArray.last!), ")
            }
        }
        return returnEpisodeString
    }
    
    // function to convert given string date to display short date format
    func createDate(longDate: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        
        let dateObject = dateFormatter.date(from: longDate)
        
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateStyle = .short
        
        let returnString = dateFormatter2.string(from: dateObject!)
        
        return returnString
    }

}
