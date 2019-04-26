import UIKit

class MovieFactory {
    private let movieServiceLocator: MovieServiceLocator
    
    init(movieServiceLocator: MovieServiceLocator) {
        self.movieServiceLocator = movieServiceLocator
    }
    
    func movieListViewController() -> UIViewController {
        let presenter = PresenterImpl(
            movieUseCase: movieServiceLocator.movieUseCase,
            movieViewToModelMapper: movieServiceLocator.movieViewToModelMapper,
            errorViewToModelMapper: movieServiceLocator.errorViewToModelMapper
        )
        let delegate = MovieListViewDelegate()
        let datasource = MovieListViewDatasource()
        
        let viewController = MovieListViewController(
            presenter: presenter,
            delegate: delegate,
            datasource: datasource
        )
        
        return viewController
    }
}
