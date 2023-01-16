//
//  ViewController.swift
//  MusicClone
//
//  Created by Sang Hyeon kim on 2023/01/06.
//

import UIKit

class MainTabBarController: UITabBarController {
    var miniPlayer: MiniPlayer!
    var isPlay = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customInit()
    }

    func customInit(){
        miniPlayer = MiniPlayer(frame: .zero)
        miniPlayer.title.text = "Now not playing..."
        miniPlayer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(miniPlayer)
        miniPlayer.bottomAnchor.constraint(equalTo: tabBar.topAnchor).isActive = true
        miniPlayer.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor).isActive = true
        miniPlayer.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor).isActive = true
        miniPlayer.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        miniPlayer.playPause.addTarget(self, action: #selector(playAndPause), for: .touchUpInside)
        miniPlayer.forward.addTarget(self, action: #selector(forward), for: .touchUpInside)
        
        
        
//        if let customView = Bundle.main.loadNibNamed(String(describing: MiniPlayer.self), owner:self, options: nil)?.first as? MiniPlayer {
////            customView.title.text = ""
//            customView.bounds = self.view.bounds
//            tabBar.addSubview(customView)
//            customView.translatesAutoresizingMaskIntoConstraints = false
//            customView.bottomAnchor.constraint(equalTo: tabBar.topAnchor).isActive = true
//            customView.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor).isActive = true
//            customView.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor).isActive = true
//            customView.heightAnchor.constraint(equalToConstant: 70).isActive = true
//        }
       
    }
    
    @objc func playAndPause() {
        var image: UIImage? = UIImage(systemName: "play.fill")
        if isPlay {
            image = UIImage(systemName: "play.fill", withConfiguration: UIImage.SymbolConfiguration(font: .preferredFont(forTextStyle: .title3), scale: .large))
            
        } else {
            image = UIImage(systemName: "pause.fill",  withConfiguration: UIImage.SymbolConfiguration(font: .preferredFont(forTextStyle: .title3), scale: .large))
        }
        miniPlayer.playPause.setImage(image, for: .normal)
        isPlay = !isPlay
        
    }
    @objc func forward(){
        print(#function)
    }
    
  
}

