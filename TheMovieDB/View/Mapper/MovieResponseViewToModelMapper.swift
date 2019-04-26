class MovieResponseViewToModelMapper: Mapper<MovieResponseView, MovieResponseModel> {
    private let movieViewToModelMapper: Mapper<MovieView, MovieModel>
    
    init(movieViewToModelMapper: Mapper<MovieView, MovieModel>) {
        self.movieViewToModelMapper = movieViewToModelMapper
    }
    
    override func reverseMap(value: MovieResponseModel) -> MovieResponseView {
        return MovieResponseView(page: value.page,
                                   totalResults: value.totalResults,
                                   totalPages: value.totalPages,
                                   results: movieViewToModelMapper.reverseMap(values: value.results)
        )
    }
}
