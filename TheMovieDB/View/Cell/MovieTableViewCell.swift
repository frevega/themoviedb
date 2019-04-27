import UIKit
import AlamofireImage

class MovieTableViewCell: UITableViewCell {
    @IBOutlet
    private weak var movieImage: UIImageView!
    @IBOutlet
    private weak var movieTitle: UILabel!
    @IBOutlet
    private weak var movieVotes: UILabel!
    @IBOutlet
    private weak var moviePopularity: UILabel!
    @IBOutlet
    private weak var movieOverview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(
        imageUrl: String,
        title: String,
        votes: String,
        popularity: String,
        overview: String
    ) {
        if let url = URL(string: imageUrl) {
            movieImage.af_setImage(withURL: url)
        }
        movieTitle.text = title
        movieVotes.text = votes
        moviePopularity.text = popularity
        movieOverview.text = overview
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        movieImage.image = UIImage(named: "placeholder")
        movieTitle.text = nil
        movieVotes.text = nil
        moviePopularity.text = nil
        movieOverview.text = nil
    }
}
