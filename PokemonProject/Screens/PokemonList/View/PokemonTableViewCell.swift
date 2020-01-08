//
//  PokemonTableViewCell.swift
//  PokemonProject
//
//  Created by Tag Livros on 08/01/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import UIKit
import Kingfisher

class PokemonTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var pokeImage: UIImageView!
    @IBOutlet weak var pokeLabel: UILabel!
    
    // MARK: - Properties
    var viewModel: PokemonCellViewModel? {
        didSet {
            setupCell()
        }
    }
    
    private func setupCell() {
        guard let cellViewModel = viewModel else { return }
        
        if let unUrl = URL(string: "https://play.pokemonshowdown.com/sprites/gen5/\(cellViewModel.pokemon.name).png") {
            let imageResource = ImageResource(downloadURL: unUrl)
            
            pokeImage.kf.setImage(with: imageResource)
            pokeLabel.text = cellViewModel.pokemon.name
        }
    }
}
