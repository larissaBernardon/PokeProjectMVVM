//
//  PokemonViewModel.swift
//  PokemonProject
//
//  Created by Tag Livros on 08/01/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import Foundation

class PokemonViewModel {
    
    // MARK: - Properties
    var networking: PokemonNetworking
    var dataProvider: Observable<DataProvider<PokemonCellViewModel>>
    var loader: Observable<Bool>
    var error: Observable<Error?>
    
    // MARK: - Initializer
    init(networking: PokemonNetworking!) {
        self.networking = networking
        self.dataProvider = Observable(DataProvider(withElements: []))
        self.loader = Observable(false)
        self.error = Observable(nil)
    }
    
    // MARK: - Functions
    func getPokemons(offset: Int, limit: Int) {
        
        loader.value = true
        
        networking.getPokemons(offset: offset,
                               limit: limit) { [weak self] result in
            guard let strongSelf = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let pokemonResponse):
                    let elements = strongSelf.mapToPokemonListViewModel(pokemonResponse)
                    strongSelf.dataProvider.value = DataProvider(withElements: [elements])
                case .error(let error):
                    strongSelf.error.value = error
                }
            }
        }
        
        loader.value = false
    }
    
    private func mapToPokemonListViewModel(_ pokemonResponse: PokemonResponse) -> [PokemonCellViewModel] {
        let result = pokemonResponse.results.map { pokemon -> PokemonCellViewModel in
            return PokemonCellViewModel(pokemon: pokemon)
        }
        return result
    }
}

//// MARK: - ViewModelProtocol
extension PokemonViewModel: ViewModelProtocol {
    subscript(section: Int) -> [PokemonCellViewModel] {
        return dataProvider.value.elements[section]
    }

    subscript(section: Int, row: Int) -> PokemonCellViewModel {
        return dataProvider.value.elements[section][row]
    }

    subscript<R>(section: Int, r: R) -> ArraySlice<PokemonCellViewModel> where R : RangeExpression, R.Bound == Array<PokemonCellViewModel>.Index {
        return dataProvider.value.elements[section][r]
    }
}

