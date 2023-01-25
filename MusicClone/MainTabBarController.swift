//
//  ViewController.swift
//  MusicClone
//
//  Created by Sang Hyeon kim on 2023/01/06.
//

import UIKit
import MediaPlayer

class MainTabBarController: UITabBarController{
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
        miniPlayer.delegate = self
       
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


extension MainTabBarController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        print(#function)
        return PlayerPresentationController(presentedViewController: presented, presenting: presenting)
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        segue.destination.modalPresentationStyle = .custom
//        segue.destination.transitioningDelegate = self
//    }
}
extension MainTabBarController: MiniPlayerDelegate {
    func touchBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let playerStoryBoard: UIStoryboard = UIStoryboard(name: "Player", bundle: nil)
        let playerViewController = playerStoryBoard.instantiateViewController(withIdentifier: "PlayController") as! PlayController
        playerViewController.transitioningDelegate = self
        playerViewController.modalPresentationStyle = .custom
        
        
        present(playerViewController, animated: true)
    }
}
