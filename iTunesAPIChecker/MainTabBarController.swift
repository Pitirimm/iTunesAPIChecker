//
//  MainTabBarController.swift
//  iTunesAPIChecker
//
//  Created by Yuriy Martinovskiy on 27.06.2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let urlStringMovie = "https://itunes.apple.com/search?term=Animation+Kids&limit=10"
    let urlStringMusic = "https://itunes.apple.com/search?term=music&media=music&limit=10"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    func setupTabBar() {
        let movieVC = viewControllers?.first as! MovieViewController
        let musicVC = viewControllers?.last as! MusicViewController
        
        movieVC.urlString = urlStringMovie
        musicVC.urlString = urlStringMusic
    }
 
}
