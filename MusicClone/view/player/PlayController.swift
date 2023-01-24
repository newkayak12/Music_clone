//
//  PlayController.swift
//  MusicClone
//
//  Created by Sang Hyeon kim on 2023/01/20.
//

import UIKit
import MediaPlayer

class PlayController: UIViewController {
    var isPlay = false
    
    @IBOutlet weak var closeBar: UIView!
    @IBOutlet weak var albumArt: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var timelineLabel: UILabel!
    
    @IBOutlet weak var lastLabel: UILabel!
    
    @IBOutlet weak var playPauseButton: UIButton!
    
    @IBOutlet weak var playProgressBar: UIProgressView!
    
    @IBOutlet weak var volumProgressBar: UIProgressView!
    
    
    @IBAction func playPause(_ sender: Any) {
        
        albumArt.constraints
        
        var image: UIImage?
        if isPlay {
            image = UIImage(systemName: "play.fill", withConfiguration: UIImage.SymbolConfiguration(font: UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .body), size: CGFloat(25)), scale: .large))
            
            UIView.animate(withDuration: 0.3) {
                self.loadViewIfNeeded()
            }
        } else {
            image = UIImage(systemName: "pause.fill",  withConfiguration: UIImage.SymbolConfiguration(font: UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .body), size: CGFloat(25)), scale: .large))
            UIView.animate(withDuration: 1) {
                self.loadViewIfNeeded()
            }
        }
        playPauseButton.setImage(image, for: .normal)
        isPlay = !isPlay
    }
    @IBAction func foward(_ sender: Any) {
    }
    @IBAction func backward(_ sender: Any) {
    }
    
    @IBAction func swipeDown(_ sender: UISwipeGestureRecognizer) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        closeBar.layer.cornerRadius = 5
        NotificationCenter.default.addObserver(forName: Notification.Name.MPMusicPlayerControllerVolumeDidChange, object: nil, queue: OperationQueue.main) { noti in
            print("NOTIFICATION", noti)
        }
        
    }
}

