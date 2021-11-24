//
//  Item.swift
//  LootLogger
//
//  Created by Marzouq Almukhlif on 09/04/1443 AH.
//

import UIKit
import Foundation

class Item : Equatable {
    var name: String
    var valueInDollars: Int?
    var serialNumber: String?
    var dateCreated: Date
  
  init(name: String, serialNumber: String?, valueInDollars: Int) {
      self.name = name
      self.valueInDollars = valueInDollars
      self.serialNumber = serialNumber
      self.dateCreated = Date()
  }
  
  convenience init(random: Bool = false) {
      if random {
          let adjectives = ["Sesquipedalian", "Rusty", "Shiny"]
          let nouns = ["Transference", "Pysychic", "MacBook Pro","Pysychic"]
          let randomAdjective = adjectives.randomElement()!
          let randomNoun = nouns.randomElement()!
          let randomName = "\(randomAdjective) \(randomNoun) \(randomAdjective) \(randomNoun) \(randomAdjective) \(randomNoun)"
          let randomValue = Int.random(in: 0..<100)
          let randomSerialNumber =
              UUID().uuidString.components(separatedBy: "-").first!
        self.init(name: randomName,
                  serialNumber: randomSerialNumber,
                  valueInDollars: randomValue)
     } else {
          self.init(name: "", serialNumber: nil, valueInDollars: 0)
      }
  }
  
  static func ==(lhs: Item, rhs: Item) -> Bool {
          return lhs.name == rhs.name
            && lhs.serialNumber == rhs.serialNumber
            && lhs.valueInDollars == rhs.valueInDollars
            && lhs.dateCreated == rhs.dateCreated
          }
  
}