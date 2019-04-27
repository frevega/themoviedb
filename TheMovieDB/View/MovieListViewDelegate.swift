import UIKit

class MovieListViewDelegate: NSObject {
    private var view: MovieListViewController?
    
    func attach(view: MovieListViewController) {
        self.view = view
    }
}

extension MovieListViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if view?.expandedIndexPath != indexPath {
            view?.expandedIndexPath = indexPath
        } else {
            view?.expandedIndexPath = IndexPath(row: -1, section: -1)
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height: CGFloat = 180.0
        if (view?.expandedIndexPath == indexPath) {
            height = UITableView.automaticDimension
        }
        
        return height
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let view = view {
            if view.tableView.contentOffset.y >= (view.tableView.contentSize.height - view.tableView.frame.size.height) {
                view.endOfTableReached()
            }
        }
    }
}
