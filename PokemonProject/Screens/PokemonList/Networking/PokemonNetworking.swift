//
//  PokemonNetworking.swift
//  PokemonProject
//
//  Created by Tag Livros on 08/01/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import Foundation

protocol PokemonNetworkingProtocol {
    func getPokemons(offset: Int, limit: Int, completion: @escaping (Result<PokemonResponse>) -> Void)
}

class PokemonNetworking: PokemonNetworkingProtocol {
    
    // MARK: - Properties
    var networking: Networking!

    // MARK: - Initializer
    init(networking: Networking = Networking()) {
        self.networking = networking
    }
    
    // MARK: - Functions
    func getPokemons(offset: Int, limit: Int, completion: @escaping (Result<PokemonResponse>) -> Void) {
        
        var parameters: [String: Any] = [:]
        parameters["offset"] = offset
        parameters["limit"] = limit
        
        networking.request("pokemon",
                           method: .get,
                           encoding: .default,
                           parameters: parameters) { result in
           switch result {
           case .success(let data):
               do {
                   let decoder = JSONDecoder()
                   let result = try decoder.decode(PokemonResponse.self, from: data!)
                   completion(Result.success(result))
               } catch let error {
                   completion(Result.error(error))
               }
           case .error(let error):
               completion(Result.error(error))
           }
       }
    }
}
