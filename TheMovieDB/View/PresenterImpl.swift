class PresenterImpl {
    weak var view: View?
    private let movieUseCase: MovieUseCase
    private let movieViewToModelMapper: Mapper<MovieView, MovieModel>
    private let errorViewToModelMapper: Mapper<ErrorView, ErrorModel>
    private var popularPageNumber = 1
    private var topRatedPageNumber = 1
    
    init(movieUseCase: MovieUseCase,
         movieViewToModelMapper: Mapper<MovieView, MovieModel>,
         errorViewToModelMapper: Mapper<ErrorView, ErrorModel>
    ) {
        self.movieUseCase = movieUseCase
        self.movieViewToModelMapper = movieViewToModelMapper
        self.errorViewToModelMapper = errorViewToModelMapper
    }
}

extension PresenterImpl: Presenter {
    func attach(view: View) {
        self.view = view
        view.prepare()
    }
    
    func popularMovies() {
        view?.showLoading()
        movieUseCase.listMoviesOrderedByPopular(page: popularPageNumber) { (response, error) in
            self.view?.hideLoading()
            guard let response = response else {
                if let error = error {
                    self.view?.show(error: self.errorViewToModelMapper.reverseMap(value: error))
                } else {
                    self.view?.show(error: ErrorView(message: "Ups! Something went wrong!"))
                }
                return
            }
            
            if response.count > 0 {
                self.view?.show(popular: self.movieViewToModelMapper.reverseMap(values: response))
                self.popularPageNumber += 1
            } else {
                self.view?.show(error: ErrorView(message: "Ups! There's nothing to show!"))
            }
        }
    }
    
    func topRatedMovies() {
        view?.showLoading()
        movieUseCase.listMoviesOrderedByTopRated(page: topRatedPageNumber) { (response, error) in
            self.view?.hideLoading()
            guard let response = response else {
                if let error = error {
                    self.view?.show(error: self.errorViewToModelMapper.reverseMap(value: error))
                } else {
                    self.view?.show(error: ErrorView(message: "Ups! Something went wrong!"))
                }
                return
            }
            
            if response.count > 0 {
                self.view?.show(topRated: self.movieViewToModelMapper.reverseMap(values: response))
                self.topRatedPageNumber += 1
            } else {
                self.view?.show(error: ErrorView(message: "Ups! There's nothing to show!"))
            }
        }
    }
}
