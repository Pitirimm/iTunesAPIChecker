//
//  PodcastViewController.swift
//  iTunesAPIChecker
//
//  Created by Yuriy Martinovskiy on 27.06.2021.
//

import UIKit

class PodcastViewController: UITableViewController {
    let networkService = NetworkService()
    var media: ItunesAnswer? = nil
    var urlString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkService.request(urlString: urlString) { [weak self] (result)  in
            switch result {
            
            case .success(let podcast):
                    self?.media = podcast
                    self?.tableView.reloadData()
         
                
            case .failure(let error):
                print(error)
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return media?.results.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PodcastCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = media?.results[indexPath.row].trackName
        content.secondaryText = media?.results[indexPath.row].artistName
        
        guard let urlString = self.media?.results[indexPath.row].artworkUrl100 else { return cell }
        guard let url = URL(string: urlString) else { return cell }
        guard let imageData = try? Data(contentsOf: url) else { return cell }
        
        content.image = UIImage(data: imageData)
        
        cell.contentConfiguration = content
        return cell
    }
}

