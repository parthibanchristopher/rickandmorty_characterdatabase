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
            VStack(alignment: .leading, spacing: 10) {
                
                Text(character.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.vertical)
                
                Text("Species: \(character.species)")
                Text("Gender: \(character.gender)")
                Text("Origin: \(character.origin.name)")
                Text("Created On: \(createDate(longDate: character.created))")
                Text("Current Status: \(character.status)")
                Text("Current Location: \(character.location.name)")
                
                Text("List of Episodes:\n\(createstring(episodelist: character.episode))")
                    .padding(.vertical)

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
        var returnString = ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        
        do {
            let dateObject = try dateFormatter.date(from: longDate)
            
            let dateFormatter2 = DateFormatter()
            dateFormatter2.dateStyle = .short
            
            returnString = dateFormatter2.string(from: dateObject!)
            
        }
        catch {
            returnString = "Error Compiling Date"
        }
        
        return returnString
    }

}
