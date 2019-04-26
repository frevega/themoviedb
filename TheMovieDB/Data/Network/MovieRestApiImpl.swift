import Alamofire

class MovieRestApiImpl: MovieRestApi {
    private let codableHelper: CodableHelper
    
    init(codableHelper: CodableHelper) {
        self.codableHelper = codableHelper
    }
    
    func fetchMovies(page: Int, endpoint: Endpoints.Movies, completionHandler: @escaping (MovieResponseEntity?, ErrorEntity?) -> Void) {
        guard let url = URL(
            string: MovieURL.Prod.url.rawValue +
            endpoint.rawValue +
            "\(page)" +
            MovieURL.Prod.apiKey.rawValue
        ) else {
            completionHandler(nil, ErrorEntity(message: "Ups! Something went wrong..."))
            return
        }
        Alamofire.request(url).responseData { (response) in
            if let data = response.data, let entity: MovieResponseEntity = try? self.codableHelper.decodeNetworkObject(object: data) {
                completionHandler(entity, nil)
            } else {
                completionHandler(nil, ErrorEntity(message: "Ups! can't fetch movies!"))
            }
        }
    }
}
