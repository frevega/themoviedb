protocol MovieDataSource {
    func fetchPopular(page: Int, completionHandler: @escaping (MovieResponseEntity?, ErrorEntity?) -> Void)
    func fetchTopRated(page: Int, completionHandler: @escaping (MovieResponseEntity?, ErrorEntity?) -> Void)
}
