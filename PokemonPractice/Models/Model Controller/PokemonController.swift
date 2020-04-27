//
//  PokemonController.swift
//  PokemonPractice
//
//  Created by Clayton Watkins on 4/26/20.
//  Copyright © 2020 Clayton Watkins. All rights reserved.
//

import Foundation

class PokemonController {
    
    var pokemon: [Pokemon] = []
    
    init(){
        loadToPersistentStore()
    }
    
    // MARK: CRUD
    // Create:
    @discardableResult func createPokemon (name: String, no: String, type: [String]) -> Pokemon {
        let newPokemon = Pokemon(name: name, no: no, type: [])
        self.pokemon.append(newPokemon)
        saveToPersistentStore()
        return newPokemon
    }
    // Read:
    
    // Persistence:
    var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        return documentsDirectory.appendingPathComponent("pokemon.plist")
    }
    
    // Saving:
    func saveToPersistentStore() {
        guard let url = persistentFileURL else {return}
        do{
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(pokemon)
            try data.write(to: url)
        }catch{
            NSLog("Error saving pokemon data: \(error)")
        }
    }
    
    // Loading:
    func loadToPersistentStore(){
        let fileManager = FileManager.default
        guard let url = persistentFileURL,
            fileManager.fileExists(atPath: url.path)
            else {return}
        do{
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            pokemon = try decoder.decode([Pokemon].self, from: data)
        }catch{
            NSLog("Error loading pokemon data: \(error)")
        }
    }
}
