//: [Previous](@previous)

import Foundation

//https://api.themoviedb.org/3/movie/now_playing?api_key=94f25094c333546dbc6445cda7e17c4a


struct Movie {
  var title: String
  var overview: String
}

struct MoviesResponse {
  let page: Int
  let totalResults: Int
  let totalPages: Int
  let results: [Movie]
}

extension Movie: Codable {}
extension MoviesResponse: Codable {}

let moviesURL = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=94f25094c333546dbc6445cda7e17c4a")!
let task = URLSession.shared.dataTask(with: moviesURL) { (data, response, _) in
  if let data = data {
    
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    do {
      let moviesResponse = try decoder.decode(MoviesResponse.self, from: data)
      print(moviesResponse.results)
    } catch {
      print(error)
    }
    
  }
}

task.resume()






