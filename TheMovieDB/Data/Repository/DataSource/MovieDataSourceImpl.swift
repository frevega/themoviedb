class MovieDataSourceImpl: MovieDataSource {
    private let restApi: MovieRestApi
    
    init(restApi: MovieRestApi) {
        self.restApi = restApi
    }
    
    func fetchPopular(page: Int, completionHandler: @escaping (MovieResponseEntity?, ErrorEntity?) -> Void) {
        restApi.fetchMovies(page: page, endpoint: Endpoints.Movies.popular) { (response, error) in
            completionHandler(response, error)
        }
    }
    
    func fetchTopRated(page: Int, completionHandler: @escaping (MovieResponseEntity?, ErrorEntity?) -> Void) {
        restApi.fetchMovies(page: page, endpoint: Endpoints.Movies.topRated) { (response, error) in
            completionHandler(response, error)
        }
    }
}
