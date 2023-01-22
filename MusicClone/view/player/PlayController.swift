//
//  PlayController.swift
//  MusicClone
//
//  Created by Sang Hyeon kim on 2023/01/20.
//

import UIKit
import AVFoundation
import MediaPlayer

class PlayController: UIViewController {
    
    @IBOutlet weak var albumArt: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var timelineLabel: UILabel!
    
    @IBOutlet weak var lastLabel: UILabel!
    
    @IBOutlet weak var playPauseButton: UIButton!
    
    @IBOutlet weak var playProgressBar: UIProgressView!
    
    @IBOutlet weak var volumProgressBar: UIProgressView!
    
    
    @IBAction func playPause(_ sender: Any) {
    }
    @IBAction func foward(_ sender: Any) {
    }
    @IBAction func backward(_ sender: Any) {
    }
    
    
    @IBAction func swipeDown(_ sender: UISwipeGestureRecognizer) {
        print(#function)
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

