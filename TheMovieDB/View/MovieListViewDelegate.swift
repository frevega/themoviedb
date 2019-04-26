import UIKit

class MovieListViewDelegate: NSObject {
    private var view: MovieListViewController?
    
    func attach(view: MovieListViewController) {
        self.view = view
    }
}

extension MovieListViewDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180.0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let view = view {
            if view.tableView.contentOffset.y >= (view.tableView.contentSize.height - view.tableView.frame.size.height) {
                view.endOfTableReached()
            }
        }
    }
}
