protocol MovieRepository {
    func fetchPopular(page: Int, completionHandler: @escaping (MovieResponseModel?, ErrorModel?) -> Void)
    func fetchTopRated(page: Int, completionHandler: @escaping (MovieResponseModel?, ErrorModel?) -> Void)
}
