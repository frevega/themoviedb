import UIKit

class MovieListViewDatasource: NSObject {
    private var view: MovieListViewController?
    private var movies = [MovieView]()
    var popularMovies = [MovieView]() {
        didSet {
            updatePopularMovies()
            view?.expandedIndexPath = IndexPath(row: -1, section: -1)
            view?.reloadTableView()
            view?.goToFirstRowInTable()
        }
    }
    var topRatedMovies = [MovieView]() {
        didSet {
            updateTopRatedMovies()
            view?.expandedIndexPath = IndexPath(row: -1, section: -1)
            view?.reloadTableView()
            view?.goToFirstRowInTable()
        }
    }
    
    func attach(view: MovieListViewController) {
        self.view = view
    }
    
    private func updatePopularMovies() {
        movies = popularMovies
    }
    
    private func updateTopRatedMovies() {
        movies = topRatedMovies
    }
}

extension MovieListViewDatasource: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: MovieTableViewCell.self)
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? MovieTableViewCell
        
        if (cell == nil) {
            cell = MovieTableViewCell(style: .default, reuseIdentifier: identifier)
        }
        
        let movieView = movies[indexPath.row]
        cell?.setData(
            imageUrl: movieView.posterPath,
            title: movieView.title,
            votes: movieView.voteCount,
            popularity: movieView.popularity,
            overview: movieView.overview
        )
        
        return cell ?? MovieTableViewCell()
    }
}
