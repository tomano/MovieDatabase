/*:
 • [Previous page](@previous) • [Next page](@next)
 # Accès réseau
 ## URLSession
 
 * Permet d'accéder à des ressources HTTP distances (HTML, Json, images etc...)
 
 
 */

import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

import Foundation

// Chaine de l'URL
let appleString = "https://www.apple.fr"

// URL
let appleURL = URL(string: appleString)!



let task = URLSession.shared.dataTask(with: appleURL) { (data, response, error) in
  if let someData = data {
    let dataString = String(data: someData, encoding: .utf8)
    print(dataString)
  }
}

task.resume()
