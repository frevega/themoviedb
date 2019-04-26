struct MovieUseCase {
    private let movieRepository: MovieRepository
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func listMoviesOrderedByPopular(page: Int, completionHandler: @escaping ([MovieModel]?, ErrorModel?) -> Void) {
        movieRepository.fetchPopular(page: page) { (response, error) in
            completionHandler(response?.results, error)
        }
    }
    
    func listMoviesOrderedByTopRated(page: Int, completionHandler: @escaping ([MovieModel]?, ErrorModel?) -> Void) {
        movieRepository.fetchTopRated(page: page) { (response, error) in
            completionHandler(response?.results, error)
        }
    }
}
