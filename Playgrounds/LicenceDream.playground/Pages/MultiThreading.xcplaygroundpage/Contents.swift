/*:
 • [Previous page](@previous) • [Next page](@next)
 # Multi Threading
 ## Grand Central Dispatch and Queues
 
 * Pourquoi faire? Principalement pour ne pas bloquer l'UI pendant l'exection de taches longues comme les accès réseau.
 
 * La gestion du multi threading se fait le plus souvent avec le framework GCD (Grand Central Dispatch).
 
 */

import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

import Foundation

// Main queue: Tous les accès à l'interface (UIKit) doivent-être effectués sur la main queue
let mainQueue = DispatchQueue.main

// Autres queues:
let otherQueue = DispatchQueue.global(qos: .userInteractive)

// Créer sa propre Queue
let serialQueue = DispatchQueue(label: "com.gn.serialqueue")

let concurrentQueue = DispatchQueue(label: "com.gn.concurrentqueue", attributes: .concurrent)

// On éxecute du code sur une queue grâce aux closures la plupart du temps de manière asynchrone

print("1")
serialQueue.async {
  sleep(3)
  print("2")
}
print("3")
/*:
 • [Previous page](@previous) • [Next page](@next)
 */




