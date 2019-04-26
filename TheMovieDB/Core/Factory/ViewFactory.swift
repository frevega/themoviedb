import UIKit

enum ViewTypes {
    case movieList
}

class ViewFactory {
    private static var movieServiceLocator = MovieServiceLocator()
    
    class func viewController(viewType: ViewTypes) -> UIViewController {
        var viewController: UIViewController
        
        switch viewType {
        case .movieList:
            viewController = MovieFactory(
                movieServiceLocator: movieServiceLocator
            ).movieListViewController()
        }
        
        return viewController
    }
}
