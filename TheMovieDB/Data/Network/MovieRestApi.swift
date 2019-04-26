protocol MovieRestApi {
    func fetchMovies(page: Int, endpoint: Endpoints.Movies, completionHandler: @escaping (MovieResponseEntity?, ErrorEntity?) -> Void)
}
