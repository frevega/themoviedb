struct MovieResponseEntity: Codable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [MovieEntity]
    
    private enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}
