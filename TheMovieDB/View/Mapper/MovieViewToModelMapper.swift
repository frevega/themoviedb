class MovieViewToModelMapper: Mapper<MovieView, MovieModel> {
    override func reverseMap(value: MovieModel) -> MovieView {
        return MovieView(
            voteCount: "\(FormatHelper.string(from: value.voteCount)) votes",
            id: value.id,
            title: "\(value.title)" + (value.releaseDate != nil ? " (\(FormatHelper.stringDate(from: value.releaseDate!)))" : "") + "\n\(value.voteAverage) user score",
            popularity: "Popularity: " + FormatHelper.string(from: value.popularity),
            posterPath: MovieURL.imageUrl + value.posterPath,
            originalLanguage: value.originalLanguage,
            originalTitle: value.originalTitle,
            overview: "Overview:\n" + value.overview
        )
    }
}
