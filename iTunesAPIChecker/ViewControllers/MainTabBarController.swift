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
    let urlStringPodcast = "https://itunes.apple.com/search?term=news&media=podcast&limit=10"

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
    }
    
    func setupTabBar() {
        let movieVC = viewControllers?[0] as! MovieViewController
        let musicVC = viewControllers?[1] as! MusicViewController
        let podcastVC = viewControllers?[2] as! PodcastViewController
        
        movieVC.urlString = urlStringMovie
        musicVC.urlString = urlStringMusic
        podcastVC.urlString = urlStringPodcast
    }
}
