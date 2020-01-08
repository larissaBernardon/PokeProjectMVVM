//
//  PokemonProjectTests.swift
//  PokemonProjectTests
//
//  Created by Tag Livros on 08/01/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import XCTest
@testable import PokemonProject

class PokemonProjectTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testStatesPokemonViewModel() {
        let networking = PokemonNetworking()
        let viewModel = PokemonViewModel(networking: networking)
           
        XCTAssertFalse(viewModel.loader.value)
           
        viewModel.getPokemons(offset: 0, limit: 20)
    }
       
    func testPokemonCellViewModel() {
        let pokemon = Pokemon(name: "pikachu", url: "https://play.pokemonshowdown.com/sprites/gen5/pikachu.png")
        let pokemonCellViewModel = PokemonCellViewModel(pokemon: pokemon)
       
        XCTAssertEqual(pokemonCellViewModel.pokemon.name, pokemon.name)
        XCTAssertEqual(pokemonCellViewModel.pokemon.url, pokemon.url)
   }
   
    func testHelperDateFunction() {
        let mockDateFormatted = "2020-01-08"
        let dateFormatted = Helper.getFormattedDate(date: Date())
       
        XCTAssertEqual(mockDateFormatted, dateFormatted)
   }

}
