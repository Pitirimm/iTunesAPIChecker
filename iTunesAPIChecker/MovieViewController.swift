//
//  ViewController.swift
//  iTunesAPIChecker
//
//  Created by Yuriy Martinovskiy on 25.06.2021.
//

import UIKit

class MovieViewController: UITableViewController {
    let networkService = NetworkService()
    var media: ItunesAnswer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://itunes.apple.com/search?term=Animation+Kids&limit=25"
        networkService.request(urlString: urlString) { [weak self] (result)  in
            switch result {
            
            case .success(let movie):
                movie.results.map { _ in
                    self?.media = movie
                    self?.tableView.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = media?.results[indexPath.row].trackName
        content.secondaryText = media?.results[indexPath.row].shortDescription
        
        DispatchQueue.global().async {
            guard let urlString = self.media?.results[indexPath.row].artworkUrl100 else { return }
            guard let url = URL(string: urlString) else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                content.image = UIImage(data: imageData)
                
            }
        }
        
        cell.contentConfiguration = content
        return cell
    }
}

