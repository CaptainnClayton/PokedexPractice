//
//  PokedexTableViewController.swift
//  PokemonPractice
//
//  Created by Clayton Watkins on 4/18/20.
//  Copyright © 2020 Clayton Watkins. All rights reserved.
//

import UIKit

class PokedexTableViewController: UIViewController {
    
    var pokemonController = PokemonController()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPokemonSegue"{
            if let addVC = segue.destination as? AddPokemonViewController{
                addVC.delegate = self
            }
        }
    }
}

extension PokedexTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonController.pokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as? PokemonTableViewCell else { return UITableViewCell() }
        let myPokemon = pokemonController.pokemon[indexPath.row]
        cell.pokemon = myPokemon
        return cell
    }
}

extension PokedexTableViewController: AddPokemonDelegate{
    func addPokemon(_ pkmn: Pokemon) {
        pokemonController.pokemon.append(pkmn)
        tableView.reloadData()
    }
}
