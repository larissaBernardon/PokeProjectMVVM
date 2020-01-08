//
//  PokemonResponse.swift
//  PokemonProject
//
//  Created by Tag Livros on 08/01/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import Foundation

class PokemonResponse: Decodable {
    var results: [Pokemon]
}

class Pokemon: Decodable {
    // MARK: - Properties
    var name: String
    var url: String
    
    // MARK: - Initializer
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}
