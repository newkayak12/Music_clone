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
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    var originalPoint: CGPoint?
    
    
    @IBOutlet weak var albumArt: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var timelineLabel: UILabel!
    
    @IBOutlet weak var lastLabel: UILabel!
    
    @IBOutlet weak var playPauseButton: UIButton!
    
    @IBOutlet weak var playProgressBar: UIProgressView!
    
    @IBOutlet weak var volumProgressBar: UIProgressView!
    
    
    @IBAction func playPause(_ sender: Any) {
        
        
        var image: UIImage?
        if isPlay {
            image = UIImage(systemName: "play.fill", withConfiguration: UIImage.SymbolConfiguration(font: UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .body), size: CGFloat(25)), scale: .large))
            
            UIView.animate(withDuration: 3) {
                self.widthConstraint?.isActive = false
                self.heightConstraint?.isActive = false
                self.loadViewIfNeeded()
            }
        } else {
            image = UIImage(systemName: "pause.fill",  withConfiguration: UIImage.SymbolConfiguration(font: UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .body), size: CGFloat(25)), scale: .large))
            
            UIView.animate(withDuration: 3) {
                self.widthConstraint?.isActive = true
                self.heightConstraint?.isActive = true
                self.loadViewIfNeeded()
            }
        }
        playPauseButton.setImage(image, for: .normal)
        isPlay = !isPlay
    }
    @IBAction func foward(_ sender: Any) {
        print(#function)
    }
    @IBAction func backward(_ sender: Any) {
    }
    
    @IBAction func pan(_ sender: UIPanGestureRecognizer) {
        let point = sender.location(in: view).y
        let changedPoint = view.frame.origin.y
        
        
        print(view.frame.height, changedPoint)
        print((view.frame.height - changedPoint) / view.frame.height)
        
        
         if sender.state == UIPanGestureRecognizer.State.ended {
             UIView.animate(withDuration: 0.1) {
                 self.view.frame.origin = self.originalPoint!
             }
         } else {
             if (view.frame.height - changedPoint) / view.frame.height <= 0.6 {
                 dismiss(animated: true)
             }
             
             UIView.animate(withDuration: 0.1) {
                     self.view.frame.origin = CGPoint(x: 0.0, y: point)
             }
         }
        
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        originalPoint = view.frame.origin
        
        
        widthConstraint = albumArt.widthAnchor.constraint(equalToConstant: 360);
        heightConstraint = albumArt.heightAnchor.constraint(equalToConstant: 360);
        
        
        NotificationCenter.default.addObserver(forName: Notification.Name.MPMusicPlayerControllerVolumeDidChange, object: nil, queue: OperationQueue.main) { noti in
            print("NOTIFICATION", noti)
        }
        
    }
}

