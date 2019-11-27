import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let url = URL(string: "https://api.themoviedb.org/3/search/movie?language=fr&api_key=94f25094c333546dbc6445cda7e17c4a&query=jack reacher")

var urlComponents = URLComponents(string: "https://api.themoviedb.org/3/search/movie")

let apiKey = URLQueryItem(name: "api_key", value: "94f25094c333546dbc6445cda7e17c4a")
let language = URLQueryItem(name: "language", value: "fr")
let query = URLQueryItem(name: "query", value: "jack reacher")

urlComponents?.queryItems = [apiKey, language, query]

print(urlComponents?.url)
//
//struct Movie {
//  var title: String
//  var overview: String
//}
//
//struct MovieResponse {
//  var results: [Movie]
//}
//
//extension MovieResponse: Codable {}
//extension Movie: Codable {}
//
//func getMovies(completionHandler: @escaping ([Movie]) -> Void) {
//  let task = URLSession.shared.dataTask(with: url!) { data, response, error in
//    if let data = data {
//      do {
//        let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
//        completionHandler(movieResponse.results)
//      } catch {
//        completionHandler([Movie]())
//        print(error)
//      }
//    }
//  }
//
//  task.resume()
//}
//
//getMovies { (movies) in
//  for movie in movies {
//    print(movie)
//  }
//}
