//
//  ViewController.swift
//  MusicClone
//
//  Created by Sang Hyeon kim on 2023/01/06.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        customInit()
    }

    func customInit(){
        
        
        if let customView = Bundle.main.loadNibNamed(String(describing: MiniPlayer.self), owner:self, options: nil)?.first as? MiniPlayer {
//            customView.title.text = ""
            customView.bounds = self.view.bounds
            tabBar.addSubview(customView)
            customView.translatesAutoresizingMaskIntoConstraints = false
            customView.bottomAnchor.constraint(equalTo: tabBar.topAnchor).isActive = true
            customView.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor).isActive = true
            customView.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor).isActive = true
            customView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        }
        
       
    }
    
  
}

