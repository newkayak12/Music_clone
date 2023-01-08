//
//  MiniPlayer.swift
//  MusicClone
//
//  Created by Sang Hyeon kim on 2023/01/08.
//

import UIKit

class MiniPlayer: UIView {


    @IBOutlet weak var playPause: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var cover: UIImageView!
    
    @IBAction func playAndPause(_ sender: Any) {
    }
    
    @IBAction func forward(_ sender: Any) {
    }
    
  
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
