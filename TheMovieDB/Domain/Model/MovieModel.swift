import Foundation

struct MovieModel {
    let voteCount: Int
    let id: Int
    let isVideo: Bool
    let voteAverage: Double
    let title: String
    let popularity: Double
    let posterPath: String
    let originalLanguage: String
    let originalTitle: String
    let genreIds: [Int]
    let backdropPath: String
    let isAdult: Bool
    let overview: String
    let releaseDate: Date?
}
