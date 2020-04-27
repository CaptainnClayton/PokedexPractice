//
//  Pokemon.swift
//  PokemonPractice
//
//  Created by Clayton Watkins on 4/18/20.
//  Copyright © 2020 Clayton Watkins. All rights reserved.
//

import Foundation

struct Pokemon: Codable{
    var name: String
    var no: String
    var type: [String]
    var hasBeenCaught: Bool = false
}
