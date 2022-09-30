//
//  CharacterView.swift
//  rickandmorty_characterdatabase
//
//  Created by Admin on 30/9/22.
//

import Foundation
import SwiftUI

// MARK: CHARACTER VIEW
struct CharacterView: View {
    
    // MARK: PROPERTIES
    var character: CharacterModel
    
    // MARK: VIEW
    var body: some View {
        HStack{
            Text(character.name)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.black)
            
            Spacer()
            
            VStack(spacing: 10){
                Text("Species: \(character.species)")
                    .foregroundColor(.black)
                Text("Status: \(character.status)")
                    .foregroundColor(.black)
            }
        }
        .padding() // padding for inside the rectangle background
        .background(
            RoundedRectangle(cornerRadius: 15.0)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0.0, y: 0.0)
        )
        .padding(.horizontal) // padding for outside the rectangle background
    }
}
