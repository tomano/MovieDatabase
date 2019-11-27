/*:
 • [Previous page](@previous) • [Next page](@next)
 # Fonctions/Closures et completion Handlers

 */

import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

import Foundation

// Les fonctions sont des types à part entiere
// On peut donc déclarer une variable de type "fonction"
// Pour la déclarer il faut inclure les arguments et son type de retour:

var operation: (Double) -> Double

var operationSansTypeRetour: (Double) -> Void

var operationSansArgumentEtSansTypeRetour: () -> Void

// On peut assigner une fonction comme n'importe quelle variable:

let result = sqrt(9)

operation = sqrt

let anotherResult = operation(9)

// une closure est une fonction qui ne porte pas de nom

let changeSignClosure: (Double) -> Double = { value in
  return -value
}

operation = changeSignClosure

let thirdResult = operation(9)

// Peut aussi s'ecrire de cette maniere:

operation = { $0 * 2 }

let fourthResult = operation(9)

// Les closures servent notement pour les "completion handlers" sur des opérations aynchrones:

func longFunction(valeur: String, completionHandler:@escaping (Error?) -> Void) {
  print("start long function")
  DispatchQueue.global(qos: .background).async {
    // Long operation
    sleep(3)
    completionHandler(nil)
  }
  print("exit long function")
}


longFunction(valeur: "toto") { (error) in
  print("finish")
}

longFunction(valeur: "toto", completionHandler: { error in
  print("Finish 2")
})
//: [Next](@next)
