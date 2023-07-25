//
//  PokemonData.swift
//  PokemonBook
//
//  Created by Hyo Myeong Ahn on 2023/07/03.
//

import Foundation

class Pokemon {
    
    var serialNumber: Int
    var name: String
    var skill: String
    var image: String
   
    init(serialNumber: Int, name: String, image: String, skill: String) {
        self.serialNumber = serialNumber
        self.name = name
        self.skill = skill
        self.image = image
    }
}

class TypeOfPokemon: Pokemon, Identifiable {
    var uuid:UUID = UUID()
    var type: String
    
    init(serialNumber: Int, name: String, image: String, skill: String, type: String) {
        self.type = type
        super.init(serialNumber: serialNumber, name: name, image: image, skill: skill)
    }
}

class Evolution1 : TypeOfPokemon {
    var skill2: String

    init(serialNumber: Int, name: String, image: String, skill: String, skill2: String, type: String) {
        self.skill2 = skill2
        super.init(serialNumber: serialNumber, name: name, image: image, skill: skill, type: type)
    }
}

class Evolution2 : Evolution1 {
    var skill3: String

    init(serialNumber: Int, name: String, type: String, image: String, skill: String, skill2: String, skill3: String) {
        self.skill3 = skill3
        super.init(serialNumber: serialNumber, name: name, image: image, skill: skill, skill2: skill2, type: type)
    }
}


var basePokemonList: [TypeOfPokemon] = [
    TypeOfPokemon(serialNumber: 1, name: "이상해씨", image: "https://data1.pokemonkorea.co.kr/newdata/pokedex/mid/000101.png",
                  skill: "몸통박치기",
                  type: "풀"
                 ),
    TypeOfPokemon(serialNumber: 4, name: "파이리", image: "https://data1.pokemonkorea.co.kr/newdata/pokedex/mid/000401.png",
                  skill: "불뿜기",
                  type: "불"
                 ),
    TypeOfPokemon(serialNumber: 7, name: "꼬부기", image: "https://data1.pokemonkorea.co.kr/newdata/pokedex/mid/000701.png",
                  skill: "물 뿜기",
                  type: "물"
                 ),
    
]

var evolution1PokemonList: [Evolution1] = [
    Evolution1(serialNumber: 2, name: "이상해풀", image: "https://data1.pokemonkorea.co.kr/newdata/pokedex/mid/000201.png",
               skill: "몸통박치기",
               skill2:"잎날가르기",
               type: "풀"
              ),
    Evolution1(serialNumber: 5, name: "리자드", image: "https://data1.pokemonkorea.co.kr/newdata/pokedex/mid/000501.png",
               skill: "불뿜기",
               skill2:"불뿜어서 죽이기",
               type: "불"
              ),
    Evolution1(serialNumber: 8, name: "어니부기", image: "https://data1.pokemonkorea.co.kr/newdata/pokedex/mid/000801.png",
               skill: "불뿜기",
               skill2:"물대포 ㅋㅋ",
               type: "물"
              ),

]

var evolution2PokemonList: [Evolution2] = [
          Evolution2(serialNumber: 3,
           name:"이상해꽃",
           type:"풀",
           image:"https://data1.pokemonkorea.co.kr/newdata/pokedex/mid/000301.png",
           skill: "몸통박치기", skill2: "잎날가르기", skill3: "솔라빔"),
          Evolution2(serialNumber: 6,
           name:"리자몽",
           type:"불",
           image:"https://data1.pokemonkorea.co.kr/newdata/pokedex/mid/000601.png",
           skill: "몸통박치기", skill2: "잎날가르기", skill3: "솔라빔"),
          Evolution2(serialNumber: 9,
           name:"거북왕",
           type:"물",
           image:"https://data1.pokemonkorea.co.kr/newdata/pokedex/mid/000901.png",
           skill: "몸통박치기", skill2: "잎날가르기", skill3: "솔라빔")

]
