protocol View: class {
    func prepare()
    func showLoading()
    func hideLoading()
    func show(popular movies: [MovieView])
    func show(topRated movies: [MovieView])
    func show(error: ErrorView)
}
