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
    var urlString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkService.request(urlString: urlString) { [weak self] (result)  in
            switch result {
            
            case .success(let movie):
                    self?.media = movie
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = media?.results[indexPath.row].trackName
        content.secondaryText = media?.results[indexPath.row].shortDescription
        
        guard let urlString = self.media?.results[indexPath.row].artworkUrl100 else { return cell }
        guard let url = URL(string: urlString) else { return cell }
        guard let imageData = try? Data(contentsOf: url) else { return cell }
        
        content.image = UIImage(data: imageData)
        
        cell.contentConfiguration = content
        return cell
    }
    
    
}

