//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}

struct Mine: _Mine_ {
    var location: GridLocation
    var explosionText: String
    
}

class ControlCenter {
    
    func addShipsAndMines(human: Human) {
        
        
        // Adds ships to the gameboard
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 0, y: 0), isVertical: false)
        human.addShipToGrid(mediumShip1)
        
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 5, y: 0), isVertical: false)
        human.addShipToGrid(mediumShip2)
        
        let smallShip1 = Ship(length: 2, location: GridLocation(x: 1, y: 2), isVertical: true)
        human.addShipToGrid(smallShip1)
        
        let largeShip1 = Ship(length: 4, location: GridLocation(x: 2, y: 3), isVertical: true)
        human.addShipToGrid(largeShip1)
        
        let xlargeShip1 = Ship(length: 5, location: GridLocation(x: 3, y: 4), isVertical: false)
        human.addShipToGrid(xlargeShip1)
        
        
        // Adds mines to the gameboard
        let mine1 = Mine(location: GridLocation(x: 3, y: 3), explosionText: "Boom!")
        human.addMineToGrid(mine1)
        
        let mine2 = Mine(location: GridLocation(x: 5, y: 3), explosionText: "Boom!")
        human.addMineToGrid(mine2)
        
    }
    
    func calculateFinalScore(gameStats: GameStats) -> Int {
        
        var finalScore: Int
        
        let enemyShipsSunk = 5 - gameStats.enemyShipsRemaining
        let sinkBonus = gameStats.sinkBonus
        
        let humanShipsRemaining = 5 - gameStats.humanShipsSunk
        let shipBonus = gameStats.shipBonus
        
        let numberOfGuesses = gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman
        let guessPenalty = gameStats.guessPenalty
        
        // Calculates the final score
        finalScore = (enemyShipsSunk * sinkBonus) + (humanShipsRemaining * shipBonus) + (numberOfGuesses * guessPenalty)
        
        print("the value of final score is (finalScore)")
        
        return finalScore
    }
}