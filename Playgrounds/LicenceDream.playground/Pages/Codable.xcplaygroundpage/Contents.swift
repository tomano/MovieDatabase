
/*:
 • [Previous page](@previous) • [Next page](@next)
 # Codable
 
 */

import PlaygroundSupport
import Foundation


struct Acteur {
  var firstName: String
  var lastName: String
}
struct Movie {
  var name: String
  var summary: String
  var acteurs: [Acteur]
}

extension Movie: Codable {
  private enum CodingKeys: String, CodingKey {
    case name = "nom"
    case summary = "résumé"
    case acteurs
  }
}

extension Acteur: Codable {}

let jp = Acteur(firstName: "Joaquim", lastName: "Phenix")
let jokerMovie = Movie(name: "Joker", summary: "résumé blah blah blah", acteurs: [jp])

let jsonEncoder = JSONEncoder()

let jokerData = try jsonEncoder.encode(jokerMovie)

let jsonDecoder = JSONDecoder()

let movie = try jsonDecoder.decode(Movie.self, from: jokerJson)

print(movie)


//: [Next](@next)
