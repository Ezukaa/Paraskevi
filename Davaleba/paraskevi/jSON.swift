//
//  jSON.swift
//  paraskevi
//
//  Created by Macintosh HD on 6/12/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation


struct MovieDetailedResponse: Codable {
    let page, totalResults, totalPages: Int
    let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Result
struct Result: Codable {
    let popularity: Double
    let voteCount: Int
    let video: Bool
    let posterPath: String
    let id: Int
    let adult: Bool
    let backdropPath: String
    let originalLanguage: OriginalLanguage
    let originalTitle: String
    let genreIDS: [Int]
    let title: String
    let voteAverage: Double
    let overview, releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case popularity
        case voteCount = "vote_count"
        case video
        case posterPath = "poster_path"
        case id, adult
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case title
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
    }
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case ko = "ko"
}



struct getAPI {
    func parseJson(result: @escaping (MovieDetailedResponse)->()){
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?language=en-US&api_key=0fa79c85c4bd0a683eb77d3ada60eca1&page=1")!
        URLSession.shared.dataTask(with: url){(data,res,err) in
            guard let data = data else {return}
            do{
                let decoder = JSONDecoder()
                let houseResponse = try decoder.decode(MovieDetailedResponse.self,from: data)
                                
                result(houseResponse)
                
                
                
            }catch {print("EEE")}
            }.resume()
    }

}
