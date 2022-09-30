//
//  HomeScreenViewModel.swift
//  rickandmorty_characterdatabase
//
//  Created by Admin on 30/9/22.
//

import Foundation

// MARK: HOME SCREEN VIEW MODEL
class HomeScreenViewModel: ObservableObject {
    
    // MARK: PROPERTIES
    @Published var charactersArray = [CharacterModel]()
    @Published var displayMessage = displayMessageString.loading.rawValue
    
    enum displayMessageString: String {
        case loading = "Loading Data... Please Wait...",
        error = "Error: Something Went Wrong. Please Try Again Later Or Contact Tech Support.",
        success = "Loading Successful."
    }
    
    // MARK: INITIALISATION
    init() {
        let networkCall = NetworkManager.shared.prepareNetworkRequest(urlString: "https://rickandmortyapi.com/api/character/")
        let networkRequest = networkCall.request
        if networkRequest != nil {
            let data = NetworkManager.shared.processNetworkRequest(request: networkRequest!)
            { data, error in
                if data != nil {
                    self.loadCharacterArray(jsonData: data!)
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
    
    // function to make network call and retrieve json data
    func retrieveJsonData(completion: @escaping (Data) -> ()){
        
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/") else {
            self.displayMessage = displayMessageString.error.rawValue
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                self.displayMessage = displayMessageString.error.rawValue
                return
            }
            
            do {
                _ = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                completion(data)
                
            }
            catch {
                DispatchQueue.main.async {
                    self.displayMessage = displayMessageString.error.rawValue
                }
            }
        }
        task.resume()
    }
    
    // function to decode json data and load it into array
    func loadCharacterArray(jsonData: Data){
        do {
            let listOfCharacters = try JSONDecoder().decode(FullData.self, from: jsonData)
            
            DispatchQueue.main.async {
                self.displayMessage = displayMessageString.success.rawValue
                self.charactersArray = listOfCharacters.results
                // saves the list of characters into array
            }
        }
        catch {
            DispatchQueue.main.async {
                self.displayMessage = displayMessageString.error.rawValue
            }
        }
    }
    
}
