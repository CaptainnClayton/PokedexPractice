//
//  PokemonTableViewCell.swift
//  PokemonPractice
//
//  Created by Clayton Watkins on 4/18/20.
//  Copyright © 2020 Clayton Watkins. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonNo: UILabel!
    
    @IBOutlet weak var pokemonType: UILabel!
    
    var pokemon: Pokemon?{
        didSet{
            updateViews()
        }
    }
    
    private func updateViews(){
        guard let pokemon = self.pokemon else { return }
        pokemonName.text = pokemon.name
        pokemonNo.text = pokemon.no
        pokemonType.text = pokemon.type.joined(separator: " / ")
    }
}
