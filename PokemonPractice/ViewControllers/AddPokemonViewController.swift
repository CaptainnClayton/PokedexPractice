//
//  AddPokemonViewController.swift
//  PokemonPractice
//
//  Created by Clayton Watkins on 4/18/20.
//  Copyright © 2020 Clayton Watkins. All rights reserved.
//

import UIKit

protocol AddPokemonDelegate{
    func addPokemon(_ pkmn: Pokemon)
}

class AddPokemonViewController: UIViewController {

    @IBOutlet weak var pokemonNameTextField: UITextField!
    @IBOutlet weak var pokemonNoTextField: UITextField!
    @IBOutlet weak var PokemonTypeTextField1: UITextField!
    @IBOutlet weak var pokemonTypeTextField2: UITextField!
    
    var delegate: AddPokemonDelegate?
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = pokemonNameTextField.text,
            let no = pokemonNoTextField.text,
            !name.isEmpty,
            !no.isEmpty
        else { return }
        
        var newPokemon = Pokemon(name: name, no: no, type: [])
        
        if let type1 = PokemonTypeTextField1.text,
        !type1.isEmpty{
            newPokemon.type.append(type1)
        }
        if let type2 = pokemonTypeTextField2.text,
        !type2.isEmpty{
            newPokemon.type.append(type2)
        }
        delegate?.addPokemon(newPokemon)
        dismiss(animated: true, completion: nil)
    }
}
