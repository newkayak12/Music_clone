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
        // Do any additional setup after loading the view.
        let miniPlayer = MiniPlayer(frame: .zero)
//        tabBar.addSubview(miniPlayer)
//        miniPlayer.topAnchor.constraint(equalTo: tabBar.topAnchor).isActive = true
//        miniPlayer.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor).isActive = true
//        miniPlayer.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor).isActive = true
//        miniPlayer.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
    }

    func customInit(){
        if let customView = Bundle.main.loadNibNamed("MiniPlayer", owner: nil, options: nil)?.first as? UIView {
            customView.bounds = self.view.bounds
            tabBar.addSubview(customView)
            customView.translatesAutoresizingMaskIntoConstraints = false
            customView.bottomAnchor.constraint(equalTo: tabBar.topAnchor).isActive = true
            customView.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor).isActive = true
            customView.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor).isActive = true
            customView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        }
    }

}

