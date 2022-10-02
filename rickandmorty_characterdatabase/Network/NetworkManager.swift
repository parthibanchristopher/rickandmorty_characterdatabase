//
//  NetworkManager.swift
//  rickandmorty_characterdatabase
//
//  Created by Admin on 30/9/22.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    var displayMessage = ""
    
    private init() { }
    
    enum errorMessage: Error, LocalizedError {
      case urlError, dataError, decodingError
        
        public var errorDescription: String? {
            switch self {
            case .urlError: return NSLocalizedString("Error Processing URL", comment: "My error")
            case .dataError: return NSLocalizedString("Error Receiving Data", comment: "My error")
            case .decodingError: return NSLocalizedString("Error Decoding Data", comment: "My error")
            }
        }
    }
    
    func processNetworkRequest(request: URLRequest, completion: @escaping (Data?, Error?) -> ()) {
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            
            guard let data = data, error == nil else {
                completion(nil, errorMessage.dataError)
                return
            }
            
            do {
                _ = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                completion(data, nil)
            }
            catch { completion(nil, errorMessage.decodingError) }
        }
        task.resume()
    }
    
    func prepareNetworkRequest(urlString: String) -> (request: URLRequest?, error: Error?) {
        
        guard let url = URL(string: urlString) else {
            return (nil, errorMessage.urlError)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return (request, nil)
    }
    
}
