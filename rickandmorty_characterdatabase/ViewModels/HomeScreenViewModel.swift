//
//  HomeScreenViewModel.swift
//  rickandmorty_characterdatabase
//
//  Created by Admin on 30/9/22.
//

import Foundation

// MARK: HOME SCREEN VIEWMODEL
class HomeScreenViewModel: ObservableObject {
    
    // MARK: PROPERTIES
    @Published var charactersArray = [CharacterModel]()
    @Published var displayMessage = displayMessageString.loading.rawValue
    
    enum displayMessageString: String {
        case loading = "Loading Data... Please Wait...",
        error = "Error: Something Went Wrong. Please Try Again Later Or Contact Tech Support.",
        success = "Loading Successful."
    }
    
    enum errorMessage: Error, LocalizedError {
      case decodingError
        
        public var errorDescription: String? {
            switch self {
            case .decodingError: return NSLocalizedString("Error Decoding Data", comment: "My error")
            }
        }
    }
    
    // MARK: INITIALISATION
    init() {
        let networkCall = NetworkManager.shared.prepareNetworkRequest(urlString: "https://rickandmortyapi.com/api/character/") // TODO: CLEAN UP URL
        
        let networkRequest = networkCall.request
        if networkRequest != nil {
            
            NetworkManager.shared.processNetworkRequest(request: networkRequest!)
            { data, error in
                if data != nil {
                    DispatchQueue.main.async {
                        let receivedData = self.loadCharacterArray(jsonData: data!)
                        self.charactersArray = receivedData.array
                    }
                }
                else {
                    DispatchQueue.main.async {
                        self.displayMessage = error!.localizedDescription
                    }
                }
            }
        }
    }
    
    // MARK: FUNCTIONS
    
    // function to decode json data and load it into array
    func loadCharacterArray(jsonData: Data) -> (array: [CharacterModel], error: Error?){
        var charactersArray = [CharacterModel]()
        
        do {
            let listOfCharacters = try JSONDecoder().decode(FullData.self, from: jsonData)
            
            DispatchQueue.main.async {
                self.displayMessage = displayMessageString.success.rawValue
            }
            charactersArray = listOfCharacters.results
            return (charactersArray, nil)
        }
        catch {
            DispatchQueue.main.async {
                self.displayMessage = displayMessageString.error.rawValue
            }
            return (charactersArray, errorMessage.decodingError)
        }
    }
}
