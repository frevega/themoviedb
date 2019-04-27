import UIKit

class MovieListViewController: UIViewController {
    @IBOutlet
    private(set) weak var tableView: UITableView!
    private var activityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
    private let presenter: Presenter?
    private let delegate: MovieListViewDelegate?
    private let datasource: MovieListViewDatasource?
    
    private var popularButton: UIBarButtonItem?
    private var topRatedButton: UIBarButtonItem?
    
    var expandedIndexPath = IndexPath(row: -1, section: -1)
    
    init(presenter: Presenter,
         delegate: MovieListViewDelegate,
         datasource: MovieListViewDatasource
    ) {
        self.presenter = presenter
        self.delegate = delegate
        self.datasource = datasource
        super.init(nibName: String(describing: MovieListViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate?.attach(view: self)
        datasource?.attach(view: self)
        presenter?.attach(view: self)
        presenter?.popularMovies()
    }
    
    private func prepareIndicatorView() {
        activityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicatorView)
        activityIndicatorView.backgroundColor = .lightGray
        activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicatorView.layer.cornerRadius = activityIndicatorView.bounds.width / 2
    }
    
    private func prepareTableView() {
        let tableViewName = String(describing: MovieTableViewCell.self)
        tableView.register(UINib(nibName: tableViewName, bundle: nil), forCellReuseIdentifier: tableViewName)
        tableView.delegate = delegate
        tableView.dataSource = datasource
    }
    
    private func prepareNavgationItem() {
        navigationItem.title = "The Movie DB"
        popularButton = UIBarButtonItem(title: "Popular", style: .plain, target: self, action: #selector(orderByPopular))
        topRatedButton = UIBarButtonItem(title: "Top Rated", style: .plain, target: self, action: #selector(orderByTopRated))
        navigationItem.rightBarButtonItems = [topRatedButton!, popularButton!]
        popularButton?.isEnabled = false
    }
    
    @objc
    func orderByPopular() {
        popularButton?.isEnabled = false
        topRatedButton?.isEnabled = true
        presenter?.popularMovies()
    }
    
    @objc func orderByTopRated() {
        popularButton?.isEnabled = true
        topRatedButton?.isEnabled = false
        presenter?.topRatedMovies()
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    func endOfTableReached() {
        popularButton!.isEnabled ? presenter?.topRatedMovies() : presenter?.popularMovies()
    }
    
    func goToFirstRowInTable() {
        tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
    }
}

extension MovieListViewController: View {
    func prepare() {
        prepareNavgationItem()
        prepareIndicatorView()
        prepareTableView()
    }
    
    func showLoading() {
        view.isUserInteractionEnabled = false
        activityIndicatorView.startAnimating()
    }
    
    func hideLoading() {
        view.isUserInteractionEnabled = true
        activityIndicatorView.stopAnimating()
    }
    
    func show(popular movies: [MovieView]) {
        datasource?.popularMovies.append(contentsOf: movies);
    }
    
    func show(topRated movies: [MovieView]) {
        datasource?.topRatedMovies.append(contentsOf: movies);
    }
    
    func show(error: ErrorView) {
        let alertView = UIAlertController(title: "Error", message: error.message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertView, animated: true)
    }
}
